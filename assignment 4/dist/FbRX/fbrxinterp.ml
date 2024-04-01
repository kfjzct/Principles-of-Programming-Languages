open Fbrxast

exception NotClosed

let fbLabelNotFound = Raise("#LabelNotFound", Int(0))
let fbTypeMismatch = Raise("#TypeMismatch", Int(0))


(*--------------------------------------------*)


exception Bug
exception RuntimeError of exnid * expr
let rec check_closed expr = 
  let rec check expr bound_vars = match expr with
    | Var (x) -> if List.mem (x) bound_vars then () else raise NotClosed
    | Int _ | Bool _ -> ()
    | Plus (e1, e2) | Minus (e1, e2) | Equal (e1, e2) | And (e1, e2) | Or (e1, e2) -> check e1 bound_vars; check e2 bound_vars
    | Not e -> check e bound_vars
    | If (e1, e2, e3) -> check e1 bound_vars; check e2 bound_vars; check e3 bound_vars
    | Function (x, e) -> check e ((x)::bound_vars)
    | Appl (e1, e2) -> check e1 bound_vars; check e2 bound_vars
    | Let (x, e1, e2) -> check e1 bound_vars; check e2 ((x)::bound_vars)
    | LetRec (f, x, e1, e2) -> check e1 ((x)::(f)::bound_vars); check e2 ((x)::(f)::bound_vars)
    | Record(fields) -> List.iter (fun (_, expr) -> check expr bound_vars) fields
    | Select(_, e) -> check e bound_vars
    | Append(e1, e2) -> check e1 bound_vars; check e2 bound_vars
    | Raise(_, e) -> check e bound_vars
    | Try(e1, _, Ident(x), e2) -> check e1 bound_vars; check e2 ((Ident(x))::bound_vars)
    | String _ -> ()
  in
  check expr []

let rec subst (s: ident * expr) (e: expr) : expr = 
  match e with
  | Var x -> if x = fst s then snd s else e
  | Plus (e1, e2) -> Plus (subst s e1, subst s e2)
  | Minus (e1, e2) -> Minus (subst s e1, subst s e2)
  | Equal (e1, e2) -> Equal (subst s e1, subst s e2)
  | And (e1, e2) -> And (subst s e1, subst s e2)
  | Or (e1, e2) -> Or (subst s e1, subst s e2)
  | Not e1 -> Not (subst s e1)
  | If (e1, e2, e3) -> If (subst s e1, subst s e2, subst s e3)
  | Function (x, e1) -> if x = fst s then Function (x, e1) else Function (x, subst s e1)
  | Appl (e1, e2) -> Appl (subst s e1, subst s e2)
  | Let (x, e1, e2) -> if x = fst s then Let (x, subst s e1, e2) else Let (x, subst s e1, subst s e2)
  | LetRec (f, x, e1, e2) -> if x = fst s || f = fst s then LetRec (f, x, e1, e2) else LetRec (f, x, subst s e1, subst s e2)
  | _ -> e

let rec eval e = 
  match e with 
    Int(n) -> Int n
    |Bool(b) -> Bool b
    |Var(v) ->
      (let (v1) = check_closed e in
      match v1 with
      () -> Var(v)
      )
    |String(s) -> String(s)
    |Plus(e1, e2) ->
      (let (v1, v2) = (eval e1, eval e2) in
      let close = check_closed e in
      if close <> () then raise NotClosed
      else
      match (v1,v2) with
      (Int(v1), Int(v2)) -> Int(v1 + v2)
      | _ -> raise Bug)
    |Minus(e1, e2) ->
      (let (v1, v2) = (eval e1, eval e2) in
      let close = check_closed e in
      if close <> () then raise NotClosed
      else
      match (v1,v2) with
      (Int(v1), Int(v2)) -> Int(v1 - v2)
      | _ -> raise Bug)
    |Equal(e1, e2) ->
      (let (v1, v2) = (eval e1, eval e2) in
      let close = check_closed e in
      if close <> () then raise NotClosed
      else
      match (v1,v2) with
      (Int(v1), Int(v2)) -> Bool(v1 = v2)
      | _ -> raise Bug)
    |And(e1, e2) ->
      (let (v1,v2) = (eval e1, eval e2) in 
      let close = check_closed e in
      if close <> () then raise NotClosed
      else
        match (v1,v2) with
        (Bool(v1), Bool(v2)) -> Bool(v1 && v2)
      | _ -> raise Bug)
    |Or(e1, e2) ->
      (let (v1,v2) = (eval e1, eval e2) in
      let close = check_closed e in
      if close <> () then raise NotClosed
      else 
        match (v1,v2) with
        (Bool(v1), Bool(v2)) -> Bool(v1 || v2)
      | _ -> raise Bug)
    |Not(e1) ->
      (let v1 = eval e1 in
      let close = check_closed e in
      if close <> () then raise NotClosed
      else
        match v1 with
        Bool v1 -> Bool(not v1)
        | _ -> raise Bug)
    |If(e1, e2, e3) ->
      (let v1 = eval e1 in
      let closed = check_closed e in
      if closed <> () then raise NotClosed
      else
      match v1 with
      (Bool(v1))-> if v1 then eval e2 else eval e3
      | _ -> raise Bug)
    |Function (e1, e2) -> 
      (let closed = check_closed e in
      if closed <> () then raise NotClosed
      else
        Function(e1, e2)
      )
    |Appl (e1, e2) ->
      (let rec apply_function f arg = match f with
      | Function (Ident x, body) ->
          let arg_val = eval arg in  
          let substituted_body = subst (Ident x, arg_val) body in  
          let result = eval substituted_body in 
          (match result with
           | Appl _ -> eval result  
           | _ -> result) 
      | Appl (f', arg') -> apply_function (eval f') arg' 
      | _ -> raise Bug in
    apply_function (eval e1) e2)
    |Let (x, e1, e2) ->
      let value = eval e1 in  
      let substituted_e2 = subst (x, value) e2 in  
      eval substituted_e2  
    
    |LetRec (f, x, func_body, in_expr) ->
      let rec self_substituting_func_body = subst ( f, Function (x, func_body)) func_body in
      let func_value = Function (x, self_substituting_func_body) in
      let substituted_in_expr = subst (f, func_value) in_expr in
      eval substituted_in_expr
    | Append(e1, e2) -> 
      let v1 = eval e1 in
      let v2 = eval e2 in
      begin match v1, v2 with
      | Record(fields1), Record(fields2) ->
          let combined_fields = List.fold_left (fun acc (k, v) ->
            if List.exists (fun (k1, _) -> k = k1) acc then acc  (* Right-hand precedence *)
            else (k, v) :: acc) fields2 fields1 in
          Record(combined_fields)
      | String(s1), String(s2) -> String(s1 ^ s2)  (* Handle string concatenation *)
      | _ -> raise Bug
      end
    | Record(fields) ->
      let evaluated_fields = List.map (fun (label, expr) -> (label, eval expr)) fields in
      Record(evaluated_fields)
    | Select(label, record_expr) ->
      let record = eval record_expr in
      begin match record with
      | Record(fields) ->
          (try 
            let _, value = List.find (fun (lab, _) -> lab = label) fields in
            value
          with Not_found -> raise Bug)
      | _ -> raise Bug 
      end
    | Raise(exnid, e) ->
      let value = eval e in
      raise (RuntimeError (exnid, value))
    | Try(e1, exnid, Ident(x), e2) ->
      (try 
        eval e1 
        with 
        | RuntimeError (id, value) when id = exnid -> eval (subst (Ident(x), value) e2)
        | ex -> raise ex)
      



      


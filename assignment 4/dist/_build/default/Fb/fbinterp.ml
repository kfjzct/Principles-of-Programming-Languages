open Fbast

exception Bug
exception NotClosed

let rec check_closed expr = 
  let rec check expr bound_vars = match expr with
    | Var (Ident x) -> if List.mem (Ident x) bound_vars then () else raise NotClosed
    | Int _ | Bool _ -> ()
    | Plus (e1, e2) | Minus (e1, e2) | Equal (e1, e2) | And (e1, e2) | Or (e1, e2) -> check e1 bound_vars; check e2 bound_vars
    | Not e -> check e bound_vars
    | If (e1, e2, e3) -> check e1 bound_vars; check e2 bound_vars; check e3 bound_vars
    | Function (Ident x, e) -> check e ((Ident x)::bound_vars)
    | Appl (e1, e2) -> check e1 bound_vars; check e2 bound_vars
    | Let (Ident x, e2, e3) -> 
      check e2 bound_vars;  (* Check the binding expression with the current bound variables *)
      check e3 ((Ident x)::bound_vars)  (* Check the body expression, adding the new variable to the list of bound variables *)
    | LetRec (Ident f, Ident x, e1, e2) -> 
      check e1 ((Ident f)::(Ident x)::bound_vars);  (* Ensure f is available for recursion in e1 *)
      check e2 ((Ident f)::bound_vars)  (* Ensure f is also available in e2 *)
    
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
      (let (v1, v2, v3) = (eval e1, eval e2, eval e3) in
      let closed = check_closed e in
      if closed <> () then raise NotClosed
      else
      match (v1, v2, v3) with
      (Bool(v1), _, _ )-> if v1 then v2 else v3
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
          let arg_val = eval arg in  (* Ensure the argument is evaluated *)
          let substituted_body = subst (Ident x, arg_val) body in  (* Substitute the argument into the function body *)
          let result = eval substituted_body in  (* Evaluate the substituted body *)
          (match result with
           | Appl _ -> eval result  (* If the result is another application, evaluate it *)
           | _ -> result)  (* If the result is not an application, return it as is *)
      | Appl (f', arg') -> apply_function (eval f') arg'  (* Handle nested applications *)
      | _ -> raise Bug in
    apply_function (eval e1) e2)
    |Let (Ident x, e1, e2) ->
      let value = eval e1 in  (* Evaluate the binding expression *)
      let substituted_e2 = subst (Ident x, value) e2 in  (* Substitute the bound value into the body *)
      eval substituted_e2  (* Evaluate the substituted body *)
    
    | LetRec (Ident f, Ident x, func_body, in_expr) ->
      (* Hypothetically substitute the function into itself for recursion; this is a simplification *)
      let rec self_substituting_func_body = subst (Ident f, Function (Ident x, func_body)) func_body in
      let func_value = Function (Ident x, self_substituting_func_body) in
      let substituted_in_expr = subst (Ident f, func_value) in_expr in
      eval substituted_in_expr

    (*what is the difference between function and application?*)
    
      



      


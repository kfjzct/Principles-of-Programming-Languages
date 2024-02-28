(*
  2024 PL Assignment 1
  
  Name                  : 
  List of Collaborators :

  Please make a good faith effort at listing people you discussed any 
  problems with here, as per the course academic integrity policy.  
  CAs/Prof need not be listed!

  Fill in the function definitions below replacing the 

    unimplemented ()

  with your code.
  
  Here are a few things to note:
  * Feel free to add "rec" to any function listed to make it recursive.
  * In some cases, you will find it helpful to define auxilliary functions,
    and you should feel free to do so.
  * Ask on Courselore about expected behavior in ambiguous cases. We do not mean
    to hide the expected behavior from you, and we hope the given descriptions
    and examples are fully representative of our expectations.
  * You must not use any mutation operations of OCaml for any of these questions
    (which we have not taught yet in any case): no arrays, for- or while-loops,
    references, etc.
  * For this first assignment you can only use things in standard library Stdlib; 
    you **cannot** use list library functions such as `List.hd` or `List.nth` 
    (but you can code your own versions of them, of course).
*)

(* Disables "unused variable" warning from dune while you're still solving these! *)
[@@@ocaml.warning "-27"]

(*
  Here is a simple function which gets passed unit, (), as argument
  and raises an exception.  It is the initial implementation for each
  function below.
*)
let unimplemented () = failwith "unimplemented"

(* ************** Section One: List operations ************** *)

(*
  1a. Write a function that returns a list after removing the element at the given index in the list.
      Raise an exception if the provided index is negative or out of bounds. The first element is index 0.
      The empty list has no valid index, so an exception is always thrown on an empty list.

  # rm_nth_exn [1;2;3;4] 2;;
  - : int list = [1;2;4]
  # rm_nth_exn ["hello";"world"] 0;;
  - : string list = ["world"]
  # rm_nth_exn [] 0
  ... throws exception ... 
*)

let rec rm_nth_exn (ls : 'a list) (n : int) : 'a list = match ls with
| [] -> failwith "Cannot remove from an empty list!"
| hd :: tl ->
  if n = 0 then tl
  else if n < 0 then failwith "Negative index does not exist!"
  else hd :: (rm_nth_exn tl (n - 1))
;;


(*
  1b. Write a function that takes a list of tuples and returns of list of the second item in the tuple.
  
  # proj2 [("hello", 1); ("world", 2)]
  - : int list = [1; 2]
  # proj2 [(100, "1001"); (200, "2001"); (0, "ACGT")]
  - : string list = ["1001"; "2001"; "ACGT"]
*)

let rec proj2 (ls : ('a * 'b) list) : 'b list = match ls with
| [] -> []
| (first, second) :: tl -> second :: proj2 tl
;;


(*
  1c. Write a function that filters and maps a list given a function [f] that returns Some or None. 
      For [x] in the list, if [f x] is [Some elt], then [elt] will be in the final list. Otherwise,
      [f x] is [None], and that element is ignored.

  # filter_map [1;2;3;4] (fun x -> if x mod 2 = 0 then Some (x * x) else None)
  - : int list = [4; 16]
  # filter_map [(1,2); (4,3); (5,6)] (fun (a, b) -> if a < b then None else Some (a + b))
  - : int list = [7]
*)



let rec filter_map (ls : 'a list) (f : 'a -> 'b option) : 'b list = 
  match ls with
  | [] -> []
  | hd :: tl ->
    match f hd with
    | Some x -> x :: filter_map tl f
    | None -> filter_map tl f
;;




(*
  1d. Write a function that returns the run-length-encoding of a given list of integers.
      The run-length-encoding of a list is a new list of tuples, where the first item in the tuple is
      an element in the list, and the second item is the number of times in a row that item occurs.
      The run-length-encoding is effectively equivalent to the list.

  # rle [4;4;1;1;1;1;1;2;2;2;2;1;1;1]
  - : (int * int) list = [(4, 2); (1, 5); (2, 4); (1, 3)]
  # rle [0;0;0;1;0;1]
  - : (int * int) list [(0, 3); (1, 1); (0, 1); (1, 1)]
*)

let rle (ls : int list) : (int * int) list = 
  let rec count_consecutive count curr l =
    match l with
    | [] -> [(curr, count)]
    | x :: xs ->
      if x = curr then count_consecutive (count + 1) curr xs
      else (curr, count) :: count_consecutive 1 x xs
  in
match ls with
| [] -> []
| hd :: tl -> count_consecutive 1 hd tl
;;


(* ************** Section Two: Nonogram verifier *************** *)

(*
  A Nonogram puzzle is a logic game on a rectangular grid with a set of clues.
  The goal of the game is to fill the grid such that the clues are satisfied.
  Each slot in the grid can be filled with a 0 or a 1. There are clues for each
  row and column, and the clues tell you the runs of the 0s in that row or column.

  Here is a full description of the game:
  https://puzzlemadness.co.uk/nonograms/medium#rules

  The "purple" squares in the link above are equivalent to a 0 in our representation.

  An example of a correctly solved Nonogram puzzle is shown below:

                                     1 
             4  3  3  2  2  2  5     3
          3  1  1  2  1  3  5  4  10 1
         -----------------------------
    10  | 0  0  0  0  0  0  0  0  0  0 
     9  | 0  0  0  0  0  0  0  0  0  1
  4  2  | 0  0  0  0  1  1  1  0  0  1
  1  3  | 1  0  1  1  1  1  0  0  0  1
     5  | 1  1  1  1  1  0  0  0  0  0
  2  2  | 1  1  1  1  1  0  0  1  0  0
     5  | 1  1  1  1  1  0  0  0  0  0
     3  | 1  1  1  1  1  1  0  0  0  1
  1  3  | 1  1  1  0  1  1  1  0  0  0
  4  2  | 1  0  0  0  0  1  1  0  0  1

  We see that the clues on the left are exactly the runs of zeros in that row, but they do not
  specify where the runs occur. Similarly for the column clues at the top.

  In this particular example, in the last row, the clue "4  2" shows that there are four consecutive 
  zeros, and then later there are two consecutive zeros, and there are no other zeros in that row
  except those specified by the clue.

  In this part of the assignment, we will implement an algorithm to check that the clues are satisfied.
  The algorithm is simple:
  1. Verify that the grid is rectangular
  2. For each row and column, calculate the run-length-encoding
  3. Filter the run-length-encoding to only the lengths of the "zero runs"
  4. Check that the resulting list equals the clue

  The representation of the grid will be an OCaml list. 

  let test_grid = 
    [[0; 0; 0; 0; 0; 0; 0; 0; 0; 0]
    ;[0; 0; 0; 0; 0; 0; 0; 0; 0; 1]
    ;[0; 0; 0; 0; 1; 1; 1; 0; 0; 1]
    ;[1; 0; 1; 1; 1; 1; 0; 0; 0; 1]
    ;[1; 1; 1; 1; 1; 0; 0; 0; 0; 0]
    ;[1; 1; 1; 1; 1; 0; 0; 1; 0; 0]
    ;[1; 1; 1; 1; 1; 0; 0; 0; 0; 0]
    ;[1; 1; 1; 1; 1; 1; 0; 0; 0; 1]
    ;[1; 1; 1; 0; 1; 1; 1; 0; 0; 0]
    ;[1; 0; 0; 0; 0; 1; 1; 0; 0; 1]]

  The column clues and row clues will be separate OCaml lists.

  let test_col_clues =
    [[3]; [4;1]; [3;1]; [3;2]; [2;1]; [2;3]; [2;5]; [5;4]; [10]; [1;3;1]]

  let test_row_clues =
    [[10]; [9]; [4;2]; [1;3]; [5]; [2;2]; [5]; [3]; [1;3]; [4;2]]

  The function itself will take in three arguments:
  1. The grid
  2. The column clues
  3. The row clues

  The result of the function will only be a boolean that tells whether the grid and clues are valid.

  Before implementing the `verify_solution` function, you will implement a few required helper functions
  along the way.
*)

(*
  2a. To perform the verification, we must check that the grid is rectangular.   
      We will not require that the grid is square. It must only be rectangular.

  # is_rectangular [[0;1]; [0;1]; [1;0]]
  - : bool = true
  # is_rectangular [[0;0;1]; [0;1;1]]
  - : bool = true
  # is_rectangular [[0]; [0;1]; [1]]
  - : bool = false
*)

let is_rectangular (grid : 'a list list) : bool =
  let rec r_length row = 
    match row with
    | [] -> 0
    | hd :: tl -> 1 + r_length tl
  and same_length rows =
    match rows with
    | [] | [_] -> true
    | row1 :: row2 :: rest ->
      if r_length row1 = r_length row2 then
        same_length (row2 :: rest)
      else
        false
  in
  same_length grid
;;

(*
  2b. We'll need to check that two lists are equal. We will do this with an `equal` parameter.

  # equal_list [1;2;3] [1;2;3] Int.equal
  - : bool = true
  # equal_list ["hello"; "world"] ["world"; "hello"] String.equal
  - : bool = false
*)

let rec equal_list (a : 'a list) (b : 'a list) (equal : 'a -> 'a -> bool) : bool = 
  match a, b with
  | [], [] -> true
  | x :: xs, y :: ys -> equal x y && equal_list xs ys equal
  | _ -> false
;;
(*
  2c. It's now time to verify the entire solution. You will likely find a few other functions helpful
      before writing this, but it depends on your implementation.
      
      Some suggestions are
        equal_grid : 'a list list -> 'a list list -> bool
        list_map : 'a list -> ('a -> 'b) -> 'b list

      ... and maybe
        transpose : 'a list list -> 'a list list

      Feel free to create these helper functions before beginning on verify_solution. Also, you are welcome
      to use any functions you wrote in Section One.

  # verify_solution test_grid test_col_clues test_row_clues
  - : bool = true
*)

(*List.map implemented for later use*)
let rec list_map lst f =
  match lst with
  | [] -> []
  | hd :: tl -> f hd :: list_map tl f
;;

(*list.rev function implemented*)
let list_rev lst =
  let rec rev lst res_lst =
    match lst with
    | [] -> res_lst
    | hd :: tl -> rev tl (hd :: res_lst)
  in
  rev lst []
;;
(*transpose function*)
let rec extract_column matrix curr_column rows_remaining =
  match matrix with
  | [] -> (list_rev curr_column, list_rev rows_remaining)
  | row :: remaining_rows ->
    match row with
    | [] -> extract_column remaining_rows [] rows_remaining
    | x :: xs -> extract_column remaining_rows (x :: curr_column) (xs :: rows_remaining)
;;
let transpose (matrix : 'a list list): 'a list list =
  match matrix with
  | [] -> []
  | [] :: _ -> []
  | _ -> 
    let rec transpose_helper matrix result =
      match matrix with
      | [] -> list_rev result
      | row :: remaining_rows ->
        match row with
        | [] -> transpose_helper remaining_rows result
        | x :: xs ->
          let column, remaining_matrix = extract_column matrix [] [] in
          transpose_helper remaining_matrix (column :: result)
    in
    transpose_helper matrix []
;;

(*filter the tuples*)
let filter_tuples (matrix : (int * int) list list) : int list list =
  list_map matrix (fun row ->
    filter_map row (fun (first, second) ->
      match first with
      | 0 -> Some second
      | _ -> None
    ) 
  )
;;




(*
  1. Verify that the grid is rectangular: is_rectangular
  2. For each row and column, calculate the run-length-encoding: for row just run it and for col transpose then run as row
  3. Filter the run-length-encoding to only the lengths of the "zero runs"
  4. Check that the resulting list equals the clue
*) 

let verify_solution (grid : int list list) (col_clues : int list list) (row_clues : int list list) : bool = 
  let row_rle = list_map grid rle in
  let row_filtered = filter_tuples row_rle in
  let transposed = transpose grid in
  let col_rle = list_map transposed rle in
  let col_filtered = filter_tuples col_rle in
  let valid = is_rectangular grid && row_filtered = row_clues && col_filtered = col_clues in
  valid
;;


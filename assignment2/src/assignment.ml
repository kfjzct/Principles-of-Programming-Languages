(*
  2024 PL Assignment 2
  
  Name                  : 
  List of Collaborators :

  Please make a good faith effort at listing people you discussed any 
  problems with here, as per the course academic integrity policy.  
  CAs/Prof need not be listed!

  Fill in the function definitions below replacing the 

    unimplemented ()

  with your code.  Feel free to add "rec" to any function listed to make
  it recursive. In some cases, you will find it helpful to define
  auxillary functions, feel free to.

  You must not use any mutation operations of OCaml for any of these
  questions: no arrays, for- or while-loops, references, etc., unless specified
  otherwise in the write-up.

  Note that you *can* use List.map etc library functions on this homework.
*)

(* Disables "unused variable" warning from dune while you're still solving these! *)
[@@@ocaml.warning "-27"]

(* Here is again our unimplemented "BOOM" function for questions you have not yet answered *)

let unimplemented _ = failwith "unimplemented"

(* ************** Section 1: Thinking like a type inferencer ************** *)

(*
   To better understand OCaml's parametric types, you are to write functions that
   return the indicated types.
   Note you can ignore the lists of type variables at the front of the types in
   the below, e.g. the `'a 'b 'c 'd.` in the `f1` type; those are OCaml notation
   meaning those types *have* to be polymorphic.  We have answered the first question
   for you to make it clear.
*)

let f0 : 'a. 'a -> int = fun _ -> 4 (* answered for you *)
let f1 : 'a 'b. 'a -> 'b -> 'b * 'a = unimplemented
let f2 : 'a 'b. 'a * 'b -> 'a = unimplemented
let f3 : 'a 'b 'c. ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c = unimplemented
let f4 : 'a 'b. 'a option -> ('a -> 'b) -> 'b option = unimplemented
let f5 : 'a. 'a list list -> 'a list = unimplemented
let f6 : 'a 'b 'c. ('a, 'b) result -> ('b -> 'c) -> 'c option = unimplemented

type ('a, 'b) sometype = Left of 'a | Right of 'b

let f7 :
      'a 'b 'c 'd.
      ('a -> 'c) -> ('b -> 'c) -> ('a, 'b) sometype -> ('d, 'c) sometype =
  unimplemented

let f8 : 'a 'b. ('a, 'b) sometype list -> 'a list * 'b list = unimplemented

(* ************** Section 2 : An ode to being lazy ************** *)

(*
   Lazy programming languages don't evaluate components of lists so it is possible to
   write an "infinite" list via OCaml pseudo-code such as

   let rec mklist n = n :: (mklist (n+1));;
   mklist 0;;

   Now, if you typed this into OCaml the `mklist 0` would unfortunately loop forever.

   **But**, if you "froze" the computation of the tail of the list by making it a
   function, we can achieve something in this lazy spirit.

   We will give you the type of lazy sequences to help you get going on this question:
*)

type 'a sequence = Nil | Sequence of 'a * (unit -> 'a sequence)

(*
   This is similar to the list type; the difference is the `unit ->` which keeps
   the tail of the list from running by making it a function.
   Here for example is how you would write an infinite sequence of zeroes:
*)
let rec zeroes = Sequence (0, fun () -> zeroes)

(*
  Here is a dummy sequence used in templates below. Remove this from the templates,
  and replace it with your answer.
*)
let unimplemented_int_sequence = Sequence (0, fun () -> unimplemented ())

(*
   It is still possible to express finite lists as sequences,
   for example here is [1; 2] as a sequence, with `Nil` denoting the empty sequence.
*)
let one_and_two = Sequence (1, fun () -> Sequence (2, fun () -> Nil))

(*
  Write a function to convert a sequence to a list. Of course if you try to 
  evaluate this on an infinite sequence such as `zeroes` above, it will not finish. 
  But we will assume sanity on the caller's part and ignore that issue in this question.  
*)
let list_of_sequence (s : 'a sequence) : 'a list = unimplemented ()

(*
   # list_of_sequence one_and_two ;;
   - : int list = [1; 2]
*)

(*
  While it is nice to have these infinite sequences, it is often useful to "cut" 
  them to a fixed size. Write a function that cuts off a sequence after a fixed 
  non-negative number of values `n`, producing a new, potentially shorter sequence.
  
  (Treat the given count `n` as the maximum number of elements allowed in the 
  output sequence. So if the input is a finite sequence and its length is less
  than the specified count, the output sequence can have less than `n` values)
*)

let cut_sequence (n : int) (s : 'a sequence) : 'a sequence = unimplemented ()

(*
   # list_of_sequence (cut_sequence 5 zeroes) ;;
   - : int list = [0; 0; 0; 0; 0]
*)

(*
  Create a sequence for the natural numbers, starting with 0.
*)
let naturals : int sequence = unimplemented_int_sequence

(*
   # list_of_sequence (cut_sequence 5 naturals) ;;
   - : int list = [0; 1; 2; 3; 4]
*)

(*
  Write a mapi function (analogous to List.mapi). This function is very similar to
  map, and the only different is that the mapper itself now takes the current index
  as an argument as well. You can find a more detailed documentation here:
  https://ocaml.org/api/List.html

  Note: We're using 0-based indexing in this function.
*)

let mapi_sequence (fn : int -> 'a -> 'b) (s : 'a sequence) : 'b sequence =
  unimplemented ()

(*
   # list_of_sequence (mapi_sequence (fun i -> fun x -> i + x) one_and_two) ;;
   - : int list = [1; 3]
   # list_of_sequence (mapi_sequence (fun i -> fun _ -> i * i) one_and_two) ;;
   - : int list = [0; 1]
*)

(*
  Now, let's write an infinite sequence that represents triangle numbers!
  (see https://en.wikipedia.org/wiki/Triangular_number for more information on
   triangle numbers)
*)

let triangles : int sequence = unimplemented_int_sequence

(*
   # list_of_sequence (cut_sequence 10 triangles) ;;
   - : int list = [0; 1; 3; 6; 10; 15; 21; 28; 36; 45]
*)

(*
  Let's write an infinite sequence that represents the fibonacci sequence.
  (see https://en.wikipedia.org/wiki/Fibonacci_number for more information on
   the fibonacci sequence)
*)

let fibonacci : int sequence = unimplemented_int_sequence

(*
   # list_of_sequence (cut_sequence 12 fibonacci) ;;
   - : int = [0; 1; 1; 2; 3; 5; 8; 13; 21; 34; 55; 89]
*)

(*
  Let's define a function quite like fibonacci called "fub" as follows:
    When n is even, then fub(n) = fub(n/2)
    When n is odd, then fub(n) = fub(n-1) + fub(n+1)
    fub(0) = 0
    fub(1) = 1

  Here is a sample of the beginning of the sequence.

  [0; 1; 1; 2; 1; 3; 2; 3; 1; 4; 3; 5; 2; 5; 3]
                                       ^  ^  ^
                                       |  |  |-----------------------------
                                       | index 13 is the sum of these two |
                                       |----------------------------------|

  And those elements at indices 12 and 14 are exactly the same as indices 6 and 7.

                        ----------------------
                        |                    |
  [0; 1; 1; 2; 1; 3; 2; 3; 1; 4; 3; 5; 2; 5; 3]
                     |                 |
                     -------------------
  
  Create an infinite sequence that represents the fub sequence.
*)
let fub : int sequence = unimplemented_int_sequence

(*
  # list_of_sequence (cut_sequence 15 fub) ;;
  - : int list = [0; 1; 1; 2; 1; 3; 2; 3; 1; 4; 3; 5; 2; 5; 3]   
*)

(* ************** Section 3 : n-ary trees ************** *)

(*
   The following data type can be used to represent a tree
   with a variable number of children from 0 to n. Each node stores an element of
   type 'a. Each node also holds a list of 'a trees. When this list is
   empty, then the Node is implicitly a leaf node. Note that all nodes
   contain data in this representation of a tree. 
*)

type 'a n_tree = Node of 'a * 'a n_tree list

(* Here is a tree that you can use for simple tests of your functions. *)

let atree =
  Node
    ( 1,
      [
        Node
          ( 2,
            [
              Node (3, []);
              Node (4, []);
              Node (5, [ Node (6, []) ]);
              Node (7, []);
            ] );
        Node (8, []);
      ] )

(*
   Suppose that someone encodes a tree by writing a list of tuples.
   The first element is the data that is stored in the node, and the
   second is the number of children. The children trees are listed
   immediately after their parent nodes.

   For example, the list

     [("a",2); ("b",2); ("c",0); ("d",0); ("e",1); ("f",1); ("g",0)]

   represents:

             a
           /   \
         b     e
       /  \    |
      c    d   f
               |
               g

   The Node with "a" is the root and has two children, and so on.

   Write a function that takes a list that encodes a tree and returns the tree.
   Note that n_tree lacks a completely empty tree case in the type; use 
   invalid_arg appropriately if the input list is empty.
*)
let decode_tree (l : ('a * int) list) : 'a n_tree = unimplemented ()

let coded_tree =
  [ (1, 2); (2, 4); (3, 0); (4, 0); (5, 1); (6, 0); (7, 0); (8, 0) ]

(* E.G. decode_tree coded_tree = atree *)

(*
   Write a function to fold over all the elements in the tree in a preorder
   manner. This is similar to the List.fold_left function in that it 
   applies the function to the element value "on the way down" the recursion.

   E.G.
     tree_fold (fun acc n -> acc + n) 0 atree = 36
*)
let tree_fold_preorder (f : 'a -> 'b -> 'a) (acc : 'a) (tree : 'b n_tree) : 'a =
  unimplemented ()

(*
  Now write a function to fold over all elements in the tree in a postorder
  manner. Still fold left over all children and apply the function to the element
  value on the way back up from the recursion.
*)
let tree_fold_postorder (f : 'a -> 'b -> 'a) (acc : 'a) (tree : 'b n_tree) : 'a
    =
  unimplemented ()

(*
  Write a function to find the node in the tree whose immediate children have the
  greatest sum. Your function will return both the node and the sum of its children.

  For example, consider `atree` defined above, which can be drawn like so:

          1
        /   \
       2     8
    / | | \
   3  4 5  7
        |
        6

  The node `2` has children who sum to 19, which is greater than the sum of any other
  node's children (`1` has sum 10, and `5` has sum 6).

  You will use polymorphic variants to "name" the values you're returning because we are
  returning two integers, and we don't want to confuse the two. In this example, your
  function will return
    ( `Node_value 2, `Child_sum 19 )
*)
let greatest_child_sum (tree : int n_tree) :
    [ `Node_value of int ] * [ `Child_sum of int ] =
  unimplemented ()

(*************** Section 4: Mutable State and Memoization ******************)

(* Note: You will need to use mutable state in some form for questions in this section *)

(*
   Cache: Pure functions (those without side effects) always produces the same value
   when invoked with the same parameter. So instead of recomputing values each time,
   it is possible to cache the results to achieve some speedup.

   The general idea is to store the previous arguments the function was called
   on and its results. On a subsequent call if the same argument is passed,
   the function is not invoked - instead, the result in the cache is immediately
   returned.

   Note: For this question you don't have to worry about the case of using the cache
   for recursive calls. i.e. if you have a function, cached_factorial, we won't expect
   your function to look at the cache in the smaller recursive calls.

   e.g. let _ = cached_factorial 1 in
        let _ = cached_factorial 3 in
        cached_factorial 5

   doesn't invoke the cache, although technically 3 and 5 can both use previous computation
   to inform their calculations.
*)

(*
  Given any function f as an argument, create a function that returns a
  data structure consisting of f and its cache.
*)
let new_cached_fun f = unimplemented ()

(*
  Write a function that takes the above function-cache data structure,
  applies an argument to it (using the cache if possible) and returns
  the result.
*)
let apply_fun_with_cache cached_fn x = unimplemented ()

(*
  The following function makes a cached version for f that looks
  identical to f; users can't see that values are being cached 
*)

let make_cached_fun (f : 'a -> 'b) : 'a -> 'b =
  let cf = new_cached_fun f in
  function x -> apply_fun_with_cache cf x

(*

# let f x = x + 1 ;;
- val f : int -> int = <fun>
# let cache_for_f = new_cached_fun f ;;
- val cache_for_f : ... 
# apply_fun_with_cache cache_for_f 1 ;;
- : int = 2
# cache_for_f ;;
- : ...
# apply_fun_with_cache cache_for_f 1 ;;
- : int = 2
# cache_for_f ;;
- : ...
# apply_fun_with_cache cache_for_f 2 ;;
- : int = 3
# cache_for_f ;;
- : ...
# apply_fun_with_cache cache_for_f 5 ;;
- : int = 6
# cache_for_f ;;
- : ...
# let cf = make_cached_fun f ;;
- val cf : int -> int = <fun>
# cf 4 ;;
- : int = 5
# cf 4 ;;
- : int = 5

*)

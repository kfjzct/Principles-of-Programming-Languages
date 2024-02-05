open OUnit2
open Assignment

(*
  This file contains a few tests but not necessarily complete coverage.  You are
   encouraged to think of more tests if needed for the corner cases.
   We will cover the details of the test syntax but with simple copy/paste it should
   not be hard to add new tests of your own without knowing the details.
   1) Write a new let which performs the test, e.g. let test_rm_nth_exn2 _ = ...
   2) Add that let-named entity to one of the test suite lists such as section1_tests
      by adding e.g.
       "rm_nth_exn 2" >:: test_rm_nth_exn2;

   Thats it! OR, even easier, just add another `assert_equal` to the existing tests.
   They will not be submitted with the rest of your code, so you may alter this file as you wish.

   Recall that you need to type "dune test" to your shell to run the test suite.
*)

(* SECTION 1 *)

let test_rm_nth_exn _ =
  assert_equal (rm_nth_exn [1;2;3;4] 2) [1;2;4];
  assert_equal (rm_nth_exn ["hello";"world"] 0) ["world"]

let test_proj2 _ =
  assert_equal (proj2 [("hello", 1); ("world", 2)]) [1; 2];
  assert_equal (proj2 [(100, "1001"); (200, "2001"); (0, "ACGT")]) ["1001"; "2001"; "ACGT"]

let test_filter_map _ =
  assert_equal (filter_map [1;2;3;4] (fun x -> if x mod 2 = 0 then Some (x * x) else None)) [4; 16];
  assert_equal (filter_map [(1,2); (4,3); (5,6)] (fun (a, b) -> if a < b then None else Some (a + b))) [7];
  assert_equal (filter_map [] (fun x -> x)) []

let test_rle _ =
  assert_equal (rle [4;4;1;1;1;1;1;2;2;2;2;1;1;1]) [(4, 2); (1, 5); (2, 4); (1, 3)];
  assert_equal (rle [0;0;0;1;0;1]) [(0, 3); (1, 1); (0, 1); (1, 1)]

let section1_tests = "Section 1" >: test_list
  [
    "rm_nth_exn" >:: test_rm_nth_exn;
    "proj2" >:: test_proj2;
    "filter_map" >:: test_filter_map;
    "rle" >:: test_rle;
  ]

(* SECTION 2 *)

let test_is_rectangular _ =
  assert_equal (is_rectangular [[0;1]; [0;1]; [1; 0]]) true;
  assert_equal (is_rectangular [[0;0;1]; [0;1;1]]) true;
  assert_equal (is_rectangular [[0]; [0;1]; [1]]) false

let test_equal_list _ =
  assert_equal (equal_list [1;2;3] [1;2;3] Int.equal) true;
  assert_equal (equal_list ["hello"; "world"] ["world"; "hello"] String.equal) false

(* This grid is missing the first column from the assignment description, but it is still valid *)
let test_good_grid = 
  [[0; 0; 0; 0; 0; 0; 0; 0; 0]
  ;[0; 0; 0; 0; 0; 0; 0; 0; 1]
  ;[0; 0; 0; 1; 1; 1; 0; 0; 1]
  ;[0; 1; 1; 1; 1; 0; 0; 0; 1]
  ;[1; 1; 1; 1; 0; 0; 0; 0; 0]
  ;[1; 1; 1; 1; 0; 0; 1; 0; 0]
  ;[1; 1; 1; 1; 0; 0; 0; 0; 0]
  ;[1; 1; 1; 1; 1; 0; 0; 0; 1]
  ;[1; 1; 0; 1; 1; 1; 0; 0; 0]
  ;[0; 0; 0; 0; 1; 1; 0; 0; 1]]

let test_good_col_clues =
  [[4;1]; [3;1]; [3;2]; [2;1]; [2;3]; [2;5]; [5;4]; [10]; [1;3;1]]

let test_good_row_clues =
  [[9]; [8]; [3;2]; [1;3]; [5]; [2;2]; [5]; [3]; [1;3]; [4;2]]

(* This grid has an error in a row and column, and is not rectangular*)
let test_bad_grid = 
  [[0; 0; 0; 0; 0; 0; 0; 0; 0]
  ;[0; 0; 0; 0; 0; 0; 0; 0; 1]
  ;[0; 0; 0; 1; 1; 1; 0; 0; 1]
  ;[0; 1; 1; 1; 1; 0; 0; 0; 1]
  ;[1; 1; 1; 1; 0; 0; 0; 0; 0]
  ;[1; 1; 1; 1; 0; 0; 1; 0; 0]
  ;[1; 1; 1; 1; 0; 0; 0; 0; 0]
  ;[1; 1; 1; 1; 1; 0; 0; 0; 1]
  ;[1; 1; 0; 1; 1; 1; 0; 0; 0]
  ;[0; 0; 0; 0; 1; 1; 0; 0; 1]]

let test_bad_col_clues =
  [[4;1]; [3;1]; [3;2]; [2;1]; [2;4]; [2;5]; [5;4]; [10]; [1;3;1]]

let test_bad_row_clues =
  [[9]; [8]; [3;2]; [1;3]; [6]; [2;2]; [5]; [3]; [1;2]; [4;2]]

let test_verify_solution _ =
  assert_equal (verify_solution test_good_grid test_good_col_clues test_good_row_clues) true;
  assert_equal (verify_solution test_bad_grid test_bad_col_clues test_bad_row_clues) false

let section2_tests = "Section 2" >: test_list
  [
    "is_rectangular" >:: test_is_rectangular;
    "equal_list" >:: test_equal_list;
    "verify_solution" >:: test_verify_solution;
  ]

let series = "Assignment1 Tests" >::: [ section1_tests; section2_tests ]
let () = run_test_tt_main series
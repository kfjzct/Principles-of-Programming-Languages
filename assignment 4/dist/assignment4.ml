(*

PoPL Assignment 4 part 2
Your Name : Jiasen
List of Collaborators : Thomas Li

   For this part, you will write some programs in Fb.  Your answers for
   this section must be in the form of OCaml strings which parse
   to Fb ASTs.  If you want a macro for repeated code, you are welcome to use OCaml
   to put strings together as we did in the `fb_examples.ml` file.
   You are also welcome to copy-paste any code from that file into here.

   Remember to test your Fb code below against the reference Fb binaries (not just
   your own implementation of Fb which could in theory be buggy) to ensure that your
   functions work correctly.

 *)

(*
   Do realize this is a VERY primitive macro system, you will want to put () around
   any definition you make or when appended the parse order could change.

   For questions in this section you are not allowed to use the Let Rec syntax even
   if you have implemented it in your interpreter. Any recursion that you use must
   entirely be in terms of Functions. Feel free to implement an Fb Y-combinator
   here.  For examples and hints, see the file "fbdk/debugscript/fb_examples.ml".

   Remember to test your code against the standard Fb binaries (and not just your own
   implementation of Fb) to ensure that your functions work correctly.

*)

(* Part 2 question 1.

   Fb fails to provide any operations over integers more complex
   than addition and subtraction.  Below, define the following
   2-argument Fb functions: less-than, multiplication, and mod, the
   modulus operator.  (Hint: if you get stuck, try getting them
   working for positive numbers first and then dealing with
   negatives.)  *)
   let ycomb =
    "(Fun code -> 
          Let repl = Fun self -> Fun x -> code (self self) x 
          In repl repl)"
   let fb_lt =
      "(" ^ ycomb ^ ") (Fun lt -> Fun x -> Fun y ->
      (" ^ ycomb ^ ") (Fun helper -> Fun x_left -> Fun x_right ->
      If x_right = y Then True
      Else If x_left = y Then False
      Else helper (x_left - 1) (x_right + 1))
      (x - 1) (x + 1))"
   let convert = 
      "(Fun x -> (x-x-x))"
   let checkneg = "(Fun x -> If (" ^ fb_lt ^ ") x 0 Then True Else False)"
   (*now we gotta check if boht are negative or just one of them are negative*)
   (*currently works for both positive and one negative, but doesn't work for if one neg or both neg*)
   (*we already handled the case where first is negative and both are positive, now just gotta check for both are negative and second is negative*)


   let fb_mult = ycomb ^ "(Fun rec -> Fun a -> Fun b ->
      If ((b = 0) Or (a = 0)) Then (0)
      Else If (b = 1) Then a
      Else If (Not((" ^ fb_lt ^ ") a 0) And ((" ^ fb_lt ^ ") b 0)) Then (rec (b) (a))
      Else If (((" ^ fb_lt ^ ") a 0) And ((" ^ fb_lt ^ ") b 0)) Then (rec (("^ convert ^") a) (("^ convert ^") b))
      Else
      a + rec (a) (b-1) 
      )"
      
   let fb_exp = ycomb^"(
    Fun rec -> Fun a -> Fun b ->
      If b = 0 Then 1
      Else
      If b = 1 Then a
      Else "^fb_mult^"(a) (rec(a)(b-1))
   )"


   

   (*
      assert(peu ("("^fb_lt^") 33 3") = "False");;
         --> 33 < 3 => False
      assert(peu ("("^fb_lt^") (-1) 3") = "True");;
         --> -1 < 3 => True
      assert(peu ("("^fb_mult^") 5 3") = "15");;
         --> 5 * 3 => 15
      assert(peu ("("^fb_mult^") (-3) 5") = "-15");;
         --> (-3) * 5 => (-15)
      assert(peu ("("^fb_exp^") 2 3") = "8");;
         --> 2 exp 3 => 8
      assert(peu ("("^fb_exp^") 3 4") = "81");;
         --> 3 mod 4 => 81
   *)
      
   (* Part 2 question 2.
   
      Fb is a simple language. But even it contains more constructs than strictly necessary.
      For example, you don't even need booleans! They can be encoded using just
      functions using what is called Church's encoding http://en.wikipedia.org/wiki/Church_encoding
   
      Essentially this encoding allows us to represent booleans as functions. For example:
   
            True --> Fun t -> Fun f -> t
            False --> Fun t -> Fun f -> f
   
      We will write five functions that work with church booleans in this section. 
      Remember that all your answers should generate Fb programs as strings.
   
   *)
      
   (* To start with let us make OCaml string versions of this Church encoding *)
   let church_true = "(Fun t -> Fun f -> t)";;
   let church_false = "(Fun t -> Fun f -> f)";;
   
   (* Write a Fb function to convert a church encoded bool to an Fb native bool.*)
   let fb_unchurch = "(Fun x -> x True False)";;
      
   (* Write a Fb function to convert an Fb native bool to a church encoded bool *)
   let fb_church = "(Fun x -> If x Then (Fun t -> Fun f -> t) Else (Fun t -> Fun f -> f))";;
      
   (*
      assert (peu @@ fb_unchurch^"("^fb_church^"(True))" = "True" );;
   *)
      
   (* Write a function to find out the logical NOT of a church encoded bool *)
   let fbchurch_not = "(Fun b -> b (Fun t -> Fun f -> f) (Fun t -> Fun f -> t))";;
      
   (* Write a function to find out the logical AND of two church encoded bools *)
   let fbchurch_and = "(Fun b1 -> Fun b2 -> b1 b2 (Fun t -> Fun f -> f))";;
      
   (* Write a function to find out the logical OR of two church encoded bools *)
   let fbchurch_or = "(Fun b1 -> Fun b2 -> b1 (Fun t -> Fun f -> t) b2)";;
      
   (* Write a function to find out the logical XOR of two church encoded bools *)
   let fbchurch_xor = "(Fun b1 -> Fun b2 -> 
    ((b1 (b2 (Fun t -> Fun f -> f) (Fun t -> Fun f -> t)) 
        (b2 (Fun t -> Fun f -> t) (Fun t -> Fun f -> f)))) 
    )";;
      
   (* Write a function which will accept an (endoded) boolean and two frozen 
         Fb expressions and will thaw only the appropriate expression. 
         (The reason for freezing the then/else code is if not they would both always run!
         Think about it.)
   *)

   (*so for now it works if we first peu fbchurch, then thaw that*)
   let thaw e = "((" ^ e ^ ") 0)"
   let fbchurch_if_then = "(Fun b -> Fun x -> Fun y -> b (x 0) (y 0))";;

   (*
      assert(peu (fb_unchurch^"("^fbchurch_not^church_true^")") = "False" );; 
         --> Not True => False
      assert(peu (fb_unchurch^"("^fbchurch_and^church_true^church_false^")") = "False" );;
         --> True And False => False
      assert(peu (fb_unchurch^"("^fbchurch_or^church_true^church_false^")") = "True" );;
         --> True Or False => True
      assert(peu (fb_unchurch^"("^fbchurch_xor^church_true^church_true^")") = "False" );;
         --> True XOr True => False    
      assert(peu (fbchurch_if_then^church_true^"(Fun _ -> 4+1)(Fun _ -> 4-1)") = "5" );;
         --> If True Then 4+1 Else 4-1 => 5 
   *)
      
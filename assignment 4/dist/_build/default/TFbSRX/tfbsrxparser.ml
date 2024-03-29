
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WITH
    | TRY
    | THEN
    | SET
    | SEMI
    | RPAREN
    | REF
    | REC
    | RCURLY
    | RAISE
    | PLUS
    | OR
    | NOT
    | MINUS
    | LPAREN
    | LET
    | LCURLY
    | INTTYPE
    | INT of (
# 24 "TFbSRX/tfbsrxparser.mly"
       (int)
# 33 "TFbSRX/tfbsrxparser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 21 "TFbSRX/tfbsrxparser.mly"
       (string)
# 40 "TFbSRX/tfbsrxparser.ml"
  )
    | GOESTO
    | GET
    | FUNCTION
    | EXN of (
# 43 "TFbSRX/tfbsrxparser.mly"
       (string)
# 48 "TFbSRX/tfbsrxparser.ml"
  )
    | EQUAL
    | EOEX
    | ELSE
    | DOT
    | COLON
    | BOOLTYPE
    | BOOL of (
# 13 "TFbSRX/tfbsrxparser.mly"
       (bool)
# 59 "TFbSRX/tfbsrxparser.ml"
  )
    | AND
  
end

include MenhirBasics

# 1 "TFbSRX/tfbsrxparser.mly"
  

open Tfbsrxast;;
open Tfbsrxpp;;


# 74 "TFbSRX/tfbsrxparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState001 : (('s, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_state
    (** State 001.
        Stack shape : TRY.
        Start symbol: main. *)

  | MenhirState002 : (('s, _menhir_box_main) _menhir_cell1_REF, _menhir_box_main) _menhir_state
    (** State 002.
        Stack shape : REF.
        Start symbol: main. *)

  | MenhirState003 : (('s, _menhir_box_main) _menhir_cell1_RAISE, _menhir_box_main) _menhir_state
    (** State 003.
        Stack shape : RAISE.
        Start symbol: main. *)

  | MenhirState004 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 004.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState005 : (('s, _menhir_box_main) _menhir_cell1_EXN, _menhir_box_main) _menhir_state
    (** State 005.
        Stack shape : EXN.
        Start symbol: main. *)

  | MenhirState006 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 006.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState007 : (('s, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_state
    (** State 007.
        Stack shape : LCURLY.
        Start symbol: main. *)

  | MenhirState012 : (('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_state
    (** State 012.
        Stack shape : label.
        Start symbol: main. *)

  | MenhirState016 : ((('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_state
    (** State 016.
        Stack shape : label type_decl.
        Start symbol: main. *)

  | MenhirState019 : (('s, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_state
    (** State 019.
        Stack shape : type_decl.
        Start symbol: main. *)

  | MenhirState026 : ((('s, _menhir_box_main) _menhir_cell1_RAISE, _menhir_box_main) _menhir_cell1_exn_def, _menhir_box_main) _menhir_state
    (** State 026.
        Stack shape : RAISE exn_def.
        Start symbol: main. *)

  | MenhirState027 : (('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_state
    (** State 027.
        Stack shape : NOT.
        Start symbol: main. *)

  | MenhirState028 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 028.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState030 : (('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_state
    (** State 030.
        Stack shape : LET.
        Start symbol: main. *)

  | MenhirState032 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 032.
        Stack shape : LET ident_decl.
        Start symbol: main. *)

  | MenhirState034 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 034.
        Stack shape : LET ident_decl ident_decl.
        Start symbol: main. *)

  | MenhirState036 : ((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_state
    (** State 036.
        Stack shape : LET ident_decl ident_decl type_decl.
        Start symbol: main. *)

  | MenhirState037 : (('s, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_state
    (** State 037.
        Stack shape : LCURLY.
        Start symbol: main. *)

  | MenhirState042 : (('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_state
    (** State 042.
        Stack shape : label.
        Start symbol: main. *)

  | MenhirState044 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 044.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState045 : (('s, _menhir_box_main) _menhir_cell1_GET, _menhir_box_main) _menhir_state
    (** State 045.
        Stack shape : GET.
        Start symbol: main. *)

  | MenhirState046 : (('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_state
    (** State 046.
        Stack shape : FUNCTION.
        Start symbol: main. *)

  | MenhirState048 : ((('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 048.
        Stack shape : FUNCTION ident_decl.
        Start symbol: main. *)

  | MenhirState050 : (((('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_state
    (** State 050.
        Stack shape : FUNCTION ident_decl type_decl.
        Start symbol: main. *)

  | MenhirState051 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 051.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState052 : (('s, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_state
    (** State 052.
        Stack shape : LCURLY.
        Start symbol: main. *)

  | MenhirState056 : (('s, _menhir_box_main) _menhir_cell1_simple_expr, _menhir_box_main) _menhir_state
    (** State 056.
        Stack shape : simple_expr.
        Start symbol: main. *)

  | MenhirState061 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 061.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState063 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 063.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState065 : (('s, _menhir_box_main) _menhir_cell1_appl_expr, _menhir_box_main) _menhir_state
    (** State 065.
        Stack shape : appl_expr.
        Start symbol: main. *)

  | MenhirState067 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 067.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState069 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 069.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState071 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 071.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState073 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 073.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState079 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 079.
        Stack shape : IF expr.
        Start symbol: main. *)

  | MenhirState081 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 081.
        Stack shape : IF expr expr.
        Start symbol: main. *)

  | MenhirState084 : ((('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 084.
        Stack shape : label expr.
        Start symbol: main. *)

  | MenhirState087 : (((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 087.
        Stack shape : LET ident_decl ident_decl type_decl expr.
        Start symbol: main. *)

  | MenhirState089 : ((((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_state
    (** State 089.
        Stack shape : LET ident_decl ident_decl type_decl expr type_decl.
        Start symbol: main. *)

  | MenhirState095 : ((('s, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 095.
        Stack shape : TRY expr.
        Start symbol: main. *)

  | MenhirState098 : (((('s, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_exn_def _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 098.
        Stack shape : TRY expr exn_def IDENT.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_appl_expr = 
  | MenhirCell1_appl_expr of 's * ('s, 'r) _menhir_state * (Tfbsrxast.expr)

and ('s, 'r) _menhir_cell1_exn_def = 
  | MenhirCell1_exn_def of 's * ('s, 'r) _menhir_state * (string * Tfbsrxast.fbtype)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Tfbsrxast.expr)

and ('s, 'r) _menhir_cell1_ident_decl = 
  | MenhirCell1_ident_decl of 's * ('s, 'r) _menhir_state * (Tfbsrxast.ident)

and ('s, 'r) _menhir_cell1_label = 
  | MenhirCell1_label of 's * ('s, 'r) _menhir_state * (Tfbsrxast.label)

and ('s, 'r) _menhir_cell1_simple_expr = 
  | MenhirCell1_simple_expr of 's * ('s, 'r) _menhir_state * (Tfbsrxast.expr)

and ('s, 'r) _menhir_cell1_type_decl = 
  | MenhirCell1_type_decl of 's * ('s, 'r) _menhir_state * (Tfbsrxast.fbtype)

and ('s, 'r) _menhir_cell1_EXN = 
  | MenhirCell1_EXN of 's * ('s, 'r) _menhir_state * (
# 43 "TFbSRX/tfbsrxparser.mly"
       (string)
# 313 "TFbSRX/tfbsrxparser.ml"
)

and ('s, 'r) _menhir_cell1_FUNCTION = 
  | MenhirCell1_FUNCTION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GET = 
  | MenhirCell1_GET of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 21 "TFbSRX/tfbsrxparser.mly"
       (string)
# 326 "TFbSRX/tfbsrxparser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LCURLY = 
  | MenhirCell1_LCURLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RAISE = 
  | MenhirCell1_RAISE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_REF = 
  | MenhirCell1_REF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TRY = 
  | MenhirCell1_TRY of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Tfbsrxast.expr) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 109 "TFbSRX/tfbsrxparser.mly"
      ( _1 )
# 361 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_02 =
  fun _1 _2 ->
    (
# 111 "TFbSRX/tfbsrxparser.mly"
      ( Appl(_1,_2) )
# 369 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_03 =
  fun _1 _2 ->
    (
# 177 "TFbSRX/tfbsrxparser.mly"
       ( (_1, _2) )
# 377 "TFbSRX/tfbsrxparser.ml"
     : (string * Tfbsrxast.fbtype))

let _menhir_action_04 =
  fun _2 ->
    (
# 179 "TFbSRX/tfbsrxparser.mly"
       ( _2 )
# 385 "TFbSRX/tfbsrxparser.ml"
     : (string * Tfbsrxast.fbtype))

let _menhir_action_05 =
  fun _1 ->
    (
# 76 "TFbSRX/tfbsrxparser.mly"
      ( _1 )
# 393 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 78 "TFbSRX/tfbsrxparser.mly"
      ( Plus(_1, _3) )
# 401 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_07 =
  fun _1 _3 ->
    (
# 80 "TFbSRX/tfbsrxparser.mly"
      ( Minus(_1, _3) )
# 409 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_08 =
  fun _1 _3 ->
    (
# 82 "TFbSRX/tfbsrxparser.mly"
      ( And(_1, _3) )
# 417 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 84 "TFbSRX/tfbsrxparser.mly"
      ( Or(_1, _3) )
# 425 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_10 =
  fun _2 ->
    (
# 86 "TFbSRX/tfbsrxparser.mly"
      ( Not _2 )
# 433 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_11 =
  fun _1 _3 ->
    (
# 88 "TFbSRX/tfbsrxparser.mly"
      ( Equal(_1, _3) )
# 441 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_12 =
  fun _2 _4 _6 ->
    (
# 90 "TFbSRX/tfbsrxparser.mly"
      ( Function(_2, _4, _6) )
# 449 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_13 =
  fun _10 _12 _3 _4 _6 _8 ->
    (
# 92 "TFbSRX/tfbsrxparser.mly"
      ( LetRec(_3, _4, _6, _8, _10, _12) )
# 457 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_14 =
  fun _2 _4 _6 ->
    (
# 94 "TFbSRX/tfbsrxparser.mly"
      ( If(_2, _4, _6) )
# 465 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_15 =
  fun _2 ->
    (
# 96 "TFbSRX/tfbsrxparser.mly"
      ( Ref _2 )
# 473 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_16 =
  fun _1 _3 ->
    (
# 98 "TFbSRX/tfbsrxparser.mly"
      ( Set(_1, _3) )
# 481 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_17 =
  fun _2 ->
    (
# 100 "TFbSRX/tfbsrxparser.mly"
      ( Get _2 )
# 489 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_18 =
  fun _2 _4 _5 _7 ->
    (
# 102 "TFbSRX/tfbsrxparser.mly"
      ( let (n, t) = _4 in Try(_2, n, Ident _5, t, _7) )
# 497 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_19 =
  fun _2 _3 ->
    (
# 104 "TFbSRX/tfbsrxparser.mly"
      ( let (n, t) = _2 in Raise(n, t, _3) )
# 505 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_20 =
  fun _1 ->
    (
# 149 "TFbSRX/tfbsrxparser.mly"
      ( Ident _1 )
# 513 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.ident))

let _menhir_action_21 =
  fun _1 ->
    (
# 144 "TFbSRX/tfbsrxparser.mly"
      ( Var _1 )
# 521 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_22 =
  fun _1 ->
    (
# 140 "TFbSRX/tfbsrxparser.mly"
      ( Lab _1 )
# 529 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.label))

let _menhir_action_23 =
  fun _1 ->
    (
# 71 "TFbSRX/tfbsrxparser.mly"
            ( _1 )
# 537 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_24 =
  fun _1 _3 ->
    (
# 133 "TFbSRX/tfbsrxparser.mly"
      ( [(_1, _3)] )
# 545 "TFbSRX/tfbsrxparser.ml"
     : ((Tfbsrxast.label * Tfbsrxast.expr) list))

let _menhir_action_25 =
  fun _1 _3 _5 ->
    (
# 135 "TFbSRX/tfbsrxparser.mly"
      ( (_1, _3)::_5 )
# 553 "TFbSRX/tfbsrxparser.ml"
     : ((Tfbsrxast.label * Tfbsrxast.expr) list))

let _menhir_action_26 =
  fun _1 _3 ->
    (
# 170 "TFbSRX/tfbsrxparser.mly"
      ( [(_1, _3)] )
# 561 "TFbSRX/tfbsrxparser.ml"
     : ((Tfbsrxast.label * Tfbsrxast.fbtype) list))

let _menhir_action_27 =
  fun _1 _3 _5 ->
    (
# 172 "TFbSRX/tfbsrxparser.mly"
      ( (_1, _3)::_5 )
# 569 "TFbSRX/tfbsrxparser.ml"
     : ((Tfbsrxast.label * Tfbsrxast.fbtype) list))

let _menhir_action_28 =
  fun _1 ->
    (
# 116 "TFbSRX/tfbsrxparser.mly"
      ( Int _1 )
# 577 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_29 =
  fun _1 ->
    (
# 118 "TFbSRX/tfbsrxparser.mly"
      ( Bool _1 )
# 585 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_30 =
  fun _1 ->
    (
# 120 "TFbSRX/tfbsrxparser.mly"
      ( _1 )
# 593 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_31 =
  fun _2 ->
    (
# 122 "TFbSRX/tfbsrxparser.mly"
      ( Record _2 )
# 601 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_32 =
  fun () ->
    (
# 124 "TFbSRX/tfbsrxparser.mly"
      ( Record [] )
# 609 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_33 =
  fun _2 ->
    (
# 126 "TFbSRX/tfbsrxparser.mly"
      ( _2 )
# 617 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_34 =
  fun _1 _3 ->
    (
# 128 "TFbSRX/tfbsrxparser.mly"
      ( Select(_3, _1) )
# 625 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.expr))

let _menhir_action_35 =
  fun () ->
    (
# 155 "TFbSRX/tfbsrxparser.mly"
      ( TInt )
# 633 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.fbtype))

let _menhir_action_36 =
  fun () ->
    (
# 157 "TFbSRX/tfbsrxparser.mly"
      ( TBool )
# 641 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.fbtype))

let _menhir_action_37 =
  fun _1 _3 ->
    (
# 159 "TFbSRX/tfbsrxparser.mly"
      ( TArrow(_1, _3) )
# 649 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.fbtype))

let _menhir_action_38 =
  fun _2 ->
    (
# 161 "TFbSRX/tfbsrxparser.mly"
      ( TRec _2 )
# 657 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.fbtype))

let _menhir_action_39 =
  fun _1 ->
    (
# 163 "TFbSRX/tfbsrxparser.mly"
      ( TRef _1 )
# 665 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.fbtype))

let _menhir_action_40 =
  fun _2 ->
    (
# 165 "TFbSRX/tfbsrxparser.mly"
      ( _2 )
# 673 "TFbSRX/tfbsrxparser.ml"
     : (Tfbsrxast.fbtype))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | BOOL _ ->
        "BOOL"
    | BOOLTYPE ->
        "BOOLTYPE"
    | COLON ->
        "COLON"
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | EOEX ->
        "EOEX"
    | EQUAL ->
        "EQUAL"
    | EXN _ ->
        "EXN"
    | FUNCTION ->
        "FUNCTION"
    | GET ->
        "GET"
    | GOESTO ->
        "GOESTO"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | INT _ ->
        "INT"
    | INTTYPE ->
        "INTTYPE"
    | LCURLY ->
        "LCURLY"
    | LET ->
        "LET"
    | LPAREN ->
        "LPAREN"
    | MINUS ->
        "MINUS"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PLUS ->
        "PLUS"
    | RAISE ->
        "RAISE"
    | RCURLY ->
        "RCURLY"
    | REC ->
        "REC"
    | REF ->
        "REF"
    | RPAREN ->
        "RPAREN"
    | SEMI ->
        "SEMI"
    | SET ->
        "SET"
    | THEN ->
        "THEN"
    | TRY ->
        "TRY"
    | WITH ->
        "WITH"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TRY (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState001 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_REF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState002 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_003 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RAISE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState003 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXN _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState004 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXN _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_EXN (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState005 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTTYPE ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOLTYPE ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState006 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTTYPE ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOLTYPE ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LCURLY (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState007 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_008 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_22 _1 in
      _menhir_goto_label _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_label : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState056 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState052 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_057 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_simple_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_34 _1 _3 in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_simple_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState065 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState069 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_066 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_appl_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BOOL _ | COLON | ELSE | EOEX | EQUAL | IDENT _ | INT _ | LCURLY | LPAREN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMI | SET | THEN | WITH ->
          let MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_02 _1 _2 in
          _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState056 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_appl_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | LCURLY ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState065
      | IDENT _v_1 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState065
      | BOOL _v_2 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState065
      | AND | COLON | ELSE | EOEX | EQUAL | MINUS | OR | PLUS | RCURLY | RPAREN | SEMI | SET | THEN | WITH ->
          let _1 = _v in
          let _v = _menhir_action_05 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState028 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState027 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REC ->
          let _menhir_s = MenhirState030 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_20 _1 in
      _menhir_goto_ident_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_ident_decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState069 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState032 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_21 _1 in
      let _1 = _v in
      let _v = _menhir_action_30 _1 in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState048 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTTYPE ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOLTYPE ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_35 () in
      _menhir_goto_type_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_type_decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState048 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState006 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState019 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_088 : type  ttv_stack. ((((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _menhir_s = MenhirState089 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REF ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RAISE ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GET ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNCTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | GOESTO ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_type_decl -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_type_decl (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _v = _menhir_action_39 _1 in
      _menhir_goto_type_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LCURLY (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState037 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LCURLY (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_32 () in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_28 _1 in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState044 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_045 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_GET (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState045 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_046 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState046 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_054 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_29 _1 in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_019 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_type_decl -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState019 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTTYPE ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOLTYPE ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_36 () in
      _menhir_goto_type_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_049 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GOESTO ->
          let _menhir_s = MenhirState050 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REF ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RAISE ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTTYPE ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GET ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNCTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOLTYPE ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState051 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTTYPE ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOLTYPE ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LCURLY (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState052 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GOESTO ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_s = MenhirState036 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REF ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RAISE ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GET ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNCTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_EXN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | REF ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GOESTO ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BOOL _ | FUNCTION | GET | IDENT _ | IF | INT _ | LCURLY | LET | LPAREN | NOT | RAISE | RPAREN | TRY ->
          let MenhirCell1_EXN (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_03 _1 _2 in
          _menhir_goto_exn_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_exn_def : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_096 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exn_def (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | GOESTO ->
              let _menhir_s = MenhirState098 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRY ->
                  _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | REF ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RAISE ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | NOT ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LET ->
                  _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LCURLY ->
                  _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | GET ->
                  _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FUNCTION ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | BOOL _v ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_RAISE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exn_def (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | INT _v_0 ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState026
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | IDENT _v_1 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState026
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | BOOL _v_2 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState026
      | _ ->
          _eRR ()
  
  and _menhir_run_024 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_04 _2 in
          _menhir_goto_exn_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_40 _2 in
          _menhir_goto_type_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | REF ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GOESTO ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_020 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_type_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | REF ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GOESTO ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BOOL _ | EQUAL | FUNCTION | GET | IDENT _ | IF | IN | INT _ | LCURLY | LET | LPAREN | NOT | RAISE | RCURLY | RPAREN | SEMI | TRY ->
          let MenhirCell1_type_decl (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_37 _1 _3 in
          _menhir_goto_type_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState016 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | REF ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GOESTO ->
          let _menhir_stack = MenhirCell1_type_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RCURLY ->
          let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_26 _1 _3 in
          _menhir_goto_record_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_record_type : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState016 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState052 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState007 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_017 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_type_decl -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_type_decl (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_27 _1 _3 _5 in
      _menhir_goto_record_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_009 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LCURLY (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_38 _2 in
      _menhir_goto_type_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_033 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState034 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTTYPE ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOLTYPE ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState032
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState026 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState050 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState069 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_101 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOEX ->
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          MenhirBox_main _v
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState061 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_063 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState063 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState067 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState069 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState071 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState073 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_exn_def _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | RCURLY | RPAREN | SEMI | THEN | WITH ->
          let MenhirCell0_IDENT (_menhir_stack, _5) = _menhir_stack in
          let MenhirCell1_exn_def (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_TRY (_menhir_stack, _menhir_s) = _menhir_stack in
          let _7 = _v in
          let _v = _menhir_action_18 _2 _4 _5 _7 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_094 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_TRY as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WITH ->
          let _menhir_s = MenhirState095 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXN _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | SET ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_REF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_REF (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_15 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_092 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_RAISE, _menhir_box_main) _menhir_cell1_exn_def as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | RCURLY | RPAREN | SEMI | THEN | WITH ->
          let MenhirCell1_exn_def (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_RAISE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_19 _2 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_091 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_10 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_090 : type  ttv_stack. (((((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_type_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | RCURLY | RPAREN | SEMI | THEN | WITH ->
          let MenhirCell1_type_decl (_menhir_stack, _, _10) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _8) = _menhir_stack in
          let MenhirCell1_type_decl (_menhir_stack, _, _6) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _12 = _v in
          let _v = _menhir_action_13 _10 _12 _3 _4 _6 _8 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_086 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SET ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON ->
          let _menhir_s = MenhirState087 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTTYPE ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOLTYPE ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMI ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState084 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RCURLY ->
          let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_24 _1 _3 in
          _menhir_goto_record_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_record_body : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState052 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState037 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expr (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_25 _1 _3 _5 in
      _menhir_goto_record_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_039 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LCURLY (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_31 _2 in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_082 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | RCURLY | RPAREN | SEMI | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_14 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_080 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SET ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE ->
          let _menhir_s = MenhirState081 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REF ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RAISE ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GET ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNCTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState079 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REF ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RAISE ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LCURLY ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GET ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNCTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | SET ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_GET -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_GET (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_17 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_076 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_type_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | RCURLY | RPAREN | SEMI | THEN | WITH ->
          let MenhirCell1_type_decl (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_12 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_074 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | OR | RCURLY | RPAREN | SEMI | SET | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_08 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_072 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COLON | ELSE | EOEX | EQUAL | OR | RCURLY | RPAREN | SEMI | SET | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_11 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_07 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_068 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | RCURLY | RPAREN | SEMI | SET | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_064 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_06 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_062 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | ELSE | EOEX | RCURLY | RPAREN | SEMI | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_16 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_060 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_33 _2 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BOOL _ | COLON | ELSE | EOEX | EQUAL | IDENT _ | INT _ | LCURLY | LPAREN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMI | SET | THEN | WITH ->
          let _1 = _v in
          let _v = _menhir_action_01 _1 in
          _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_label (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_label -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState042 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_012 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_label -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState012 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTTYPE ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOLTYPE ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_label (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_label (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState000 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REF ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RAISE ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LCURLY ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GET ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FUNCTION ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 180 "TFbSRX/tfbsrxparser.mly"
  

# 2773 "TFbSRX/tfbsrxparser.ml"

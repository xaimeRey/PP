user@user-NBR-WAX9:~$ ocaml
        OCaml version 4.13.1

# 1+2
  1+2;;
Error: This expression has type int
       This is not a function; it cannot be applied.
# 1+2;;
- : int = 3
# 1+2;
  ;
  quir
  quit
  stop
  hola;;
Error: Syntax error
# max_int;;
- : int = 4611686018427387903
# 2.*. asin 1.;;        
- : float = 3.14159265358979312
# 2*3;;
- : int = 6
# ^CInterrupted.
# ^CInterrupted.
# 2 *. 1.5;;                
Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean `2.'?
# 2 * 1.5;;
Error: This expression has type float but an expression was expected of type
         int
#  
  ;;
# 1+2
  
  
  
  ;;
- : int = 3
# 1+2;
  2*3;
  ;;
Warning 10 [non-unit-statement]: this expression should have type unit.
- : int = 6
# "hola";;
- : string = "hola"
# "hola ke ase";;
- : string = "hola ke ase"
# '1'
  ;;
- : char = '1'
# 'e';;
- : char = 'e'
# '22';;
Error: Invalid literal 22'
# "22";;
- : string = "22"
# 'ñ';;;
Alert deprecated: ISO-Latin1 characters in identifiers
Error: Syntax error
# 'ñ';;;
Alert deprecated: ISO-Latin1 characters in identifiers
Error: Syntax error
# "hola \nke ase";;
- : string = "hola \nke ase"
# "hola '\n' ke ase";;
- : string = "hola '\n' ke ase"
# '\001';;
- : char = '\001'
# '\045';;
- : char = '-'
# bool;
  ;;
Error: Unbound value bool
# bool;;
Error: Unbound value bool
# bool holakease;;
Error: Unbound value bool
# bool holakease true;;
Error: Unbound value bool
# true;;
- : bool = true
# false;
  ;;
- : bool = false
# 'a' == 'v';;
- : bool = false
# 'a' = 'v';;
- : bool = false
# 'a' != 'v';;
- : bool = true
# "para" ^ " conchudo";;
- : string = "para conchudo"
# asin 1;;
Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean `1.'?
# asin 1.;;
- : float = 1.57079632679489656
# asin 0.5 +. 0.5;;
- : float = 1.02359877559829893
# asin (0.5 +. 0.5);;
- : float = 1.57079632679489656
# jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj# jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
  ;;
Error: Unbound value jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
# 4/3;;
- : int = 1
# 4. /. 3.;;
- : float = 1.33333333333333326
# 4 /. 3;;
Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean `4.'?
# 4/(3+1);;
- : int = 1
# asin;;          
- : float -> float = <fun>
# asin 4;;
Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean `4.'?
# asin 4.;;
- : float = nan
# asin 0;;
Error: This expression has type int but an expression was expected of type
         float
  Hint: Did you mean `0.'?
# asin 0.;;
- : float = 0.
# asin 0.66;;
- : float = 0.72081876087008967
# x -> 3;;
Error: Syntax error
# hola(int x) -> x+1;;
Error: Syntax error
# hola(int x)
  x+1;;
Error: Unbound value hola
# hola(int x){
  x+1;}
  ;;
Error: Syntax error: '}' expected
Line 1, characters 11-12:   This '{' might be unmatched
# hola(int x){ x+1 };;
Error: Syntax error: '}' expected
Line 1, characters 11-12:   This '{' might be unmatched
# hola(int x){ x+1; };;
Error: Syntax error: '}' expected
Line 1, characters 11-12:   This '{' might be unmatched
# abs (-3);;
- : int = 3
# abs 1-6;;
- : int = -5
# abs (1-6);;
- : int = 5
# print_endline "hola ke ase";;
hola ke ase
- : unit = ()
# ();;
- : unit = ()
# print_endline;;
- : string -> unit = <fun>
# 

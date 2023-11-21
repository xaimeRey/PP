(* DEFINICION TIPOS DE DATOS *)

type numero =
I of int 
| F of float;;

let rec first_int = function
  [] -> raise Not_found
  | I n :: _ -> n
  | _ :: t -> first_int t;;

type intplus = Int of int | NoInt;; (* Constructor constante que no requiere de argumentos siempre *)

let div i1 i2 = 
  match i1, i2 with
  _, Int 0 -> NoInt
  | Int n1, Int n2 -> Int (n1/n2)
  | _ -> NoInt;;

let (//) = div;; (* Asignamos a la función la doble barra para que sea más ágil utilizarla *)



type palo = Diamante | Corazon | Pica | Trebol;; (* Podemos usar el type para hacer un enum (representación de constantes) *)
type boolean = True | False;;
let esrojo = function
  Diamante | Corazon -> True
  | _ -> False;;



type nat = One | Succ of nat;; (* No hace falta poner rec en la definición de tipos, se sobreentiende *)

let rec nat_of_int = function
  1 -> One
  | n -> Succ (nat_of_int (n-1));;



type dobleint = L of int | R of int;;

type entero = Zero | Pos of nat | Neg of nat;;

let absoluto = function
  Neg n -> Pos n
  | e -> e;;

let opuesto = function
  Zero -> Zero
  | Pos n -> Neg n
  | Neg n -> Pos n;;

let entero_of_int = function
  0 -> Zero
  | n -> if n > 0 then Pos (nat_of_int n)
         else Neg (nat_of_int (-n));;

type 'a option = None | Some of 'a;;
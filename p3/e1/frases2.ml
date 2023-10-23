(* x - y;; error de ejecución: no tienen valores asignados *)

let x = 1;;
(* val x : int = 1 *)

(* x - y;; error de ejecución: y no tiene un valor asignado *)

let y = 2;;
(* val y : int = 2 *)

(function t -> t) (x - y);;
(* - : int = -1 *)

(function t -> t - y) (y);;
(* - : int = 0 *)

(function t -> t) (x - y);;
(* - : int = -1 *)

(* z;; error de ejecución: z no tiene valor asignado *)

let z = x + y;;
(* val z : int = 3*)

(function t -> t) (z);;
(* - : int = 3*)

let x = 5;;
(* val x : int = 5*)

(function t -> t) (x+y);;
(* - : int = 7 *)

(function t -> t) (z);;
(* - : int = 3 *)

(function t -> x + t) (5);;
(* - : int = 10 *)

(function t -> t) (x+y);;
(* - : int = 7 *)

(function x -> (function y -> x + y + z) (x * y)) (x + y);;
(* - : int = 24 *)

(function t -> t) (x+y+z);;
(* - : int  =  10 *)

function x -> 2 * x;;
(* - : int -> int = <fun> *)

(function x -> 2 * x) (2 + 1);;
(* - : int = 6 *)

(function x -> 2 * x) 2 + 1;;
(* - : int = 5 *)

let f = function x -> 2 * x;;
(* val f : int -> int = <fun> *)

f;;
(* - : int -> int = <func> *)

f (2 + 1);;
(* - : int = 6 *)

f 2 + 1;;
(* - : int = 5 *)

f x;;
(* - : int  = 10 *)

let x = 100;;
(* val x : int = 100 *)

f x;;
(* - : int = 200 *)

let m = 1000;;
(* val m : int = 1000 *)

let g = function x -> x + m;;
(* val g : int -> int = <fun> *)

g;;
(* - : int -> int = <fun> *)

g 3;;
(* - : int = 1003 *)

let istrue = function true -> true;;
(* val istrue : bool -> bool = <fun> *)

istrue;;
(* - : bool -> bool = <fun> *)

istrue (1 < 2);;
(* - : bool = true *)

(* istrue (2 < 1);; error de ejecución: la función no tiene salida definida *)

(* istrue 0;; error de tipos: se esperaba un tipo bool, 0 es int *)

let iscero_v1 = function 0 -> true;;
(* val iscero_v1 : int -> bool = <fun> *)

iscero_v1 0;;
(* - : bool = true *)

(* iscero_v1 0.;; error de tipos: int esperado, 0 es tipo float *)

(* iscero_v1 1;; error de ejecución: función no tiene salida definida para este caso *)

let iscero_v2 = function 0 -> true | _ -> false;;
(* val iscero_v2 : int -> bool = <fun> *)

iscero_v2 0;;
(* - : bool = true *)

iscero_v2 1;;
(* - : bool = false *)

(* iscero_v2 0.;; error de tipos: se esperaba tipo int, 0 es tipo float *)

let all_to_true = function true -> true | false -> true;;
(* val all_to_true : bool -> bool = <fun> *)

all_to_true (1 < 2);;
(* - : bool = true *)

all_to_true (2 < 1);;
(* - : bool = true *)

let first_all_to_true = all_to_true;;
(* val first_all_to_true : bool -> bool = <fun> *)

let all_to_true = function x -> true;;
(* val all_to_true : 'a -> bool = <fun> *)

all_to_true(1 < 2);;
(* - : bool = true *)

all_to_true(2 < 1);;
(* - : bool = true *)

all_to_true 0;;
(* - : bool = true *)

(* first_all_to_true 0;; error de tipos: se espera tipo bool, 0 es tipo int *)

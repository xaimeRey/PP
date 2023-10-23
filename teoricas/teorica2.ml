let alltrue = function
  true -> true
  false -> true;;

let alltrue = function
 x -> true;;

let alltrue = function
  (_ : bool) -> true;;

let alltrue : bool -> bool = function
  _ -> true;;


let notzero = function
  0 -> false
  _ -> true;; (* SI PONEMOS EL COMODÍN PRIMERO, VA A DEVOLVER SIEMPRE TRUE PORQUE EL 0 TAMBIÉN CUENTA COMO VALOR VÁLIDO EN EL COMODÍN *)


let x = 1000 + 24 in x * x;;

(function x -> x * x) (1000 + 24);; (* primero se evalúa el argumento (1000+24) y luego se asocia el resultado con la x, por lo tanto se ejecuta la función sobre el argumento *)
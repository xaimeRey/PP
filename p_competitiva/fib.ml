(*
  Xaime Rey Domínguez
  Dada la siguiente propiedad de la sucesión de Fibonacci : https://en.wikipedia.org/wiki/Fibonacci_sequence#Matrix_form ,
  opté por implementar un algoritmo basado en la multiplicación de los elementos pertenecientes a listas que actúan como matrices.
*)
let rec obtenerElemento l n = (* Función auxiliar que nos devolverá el elemento requerido de la lista *)
  if n = 0 then
    List.hd l
  else
    obtenerElemento (List.tl l) (n-1);;

let multiplicarListas l1 l2 = (* Función que devolverá el producto de la multiplicación de dos listas utilizando las propiedades de la multiplicación de matrices *)
  [(Z.add (Z.mul (obtenerElemento l1 0) (obtenerElemento l2 0)) (Z.mul (obtenerElemento l1 1) (obtenerElemento l2 2)) ) ; (Z.add (Z.mul (obtenerElemento l1 0) (obtenerElemento l2 1)) (Z.mul (obtenerElemento l1 1) (obtenerElemento l2 3)) ) ; (Z.add (Z.mul (obtenerElemento l1 2) (obtenerElemento l2 0)) (Z.mul (obtenerElemento l1 3) (obtenerElemento l2 2)) ) ; (Z.add (Z.mul (obtenerElemento l1 2) (obtenerElemento l2 1)) (Z.mul (obtenerElemento l1 3) (obtenerElemento l2 3)) )];;

let rec checkPotencia l n = (* Función principal que iterara recursivamente hasta llegar al elemento deseado de la sucesión de Fibonacci *)
  if n = 0 then
    [Z.one;Z.one;Z.one;Z.one]
  else if n = 1 then
    l
  else if n mod 2 = 0 then
    checkPotencia (multiplicarListas l l) (n/2)
  else
    multiplicarListas ((checkPotencia (multiplicarListas l l)) (n/2)) l;;

let fib =
  print_endline(Z.to_string(List.hd(List.tl(checkPotencia [Z.one;Z.one;Z.one;Z.zero] (int_of_string Sys.argv.(1))))));;
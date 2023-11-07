let fib =
  let rec aux x act prev =
    if (Z.compare x Z.zero) == 0 then
      print_endline(Z.to_string prev)
    else
      aux (Z.sub x Z.one) (Z.add act prev) act
  in aux (Z.of_int (int_of_string Sys.argv.(1))) Z.one Z.zero;;

let fib n =
  let rec aux x =
    if x = Z.zero || x = Z.one then
      Z.one
    else if (Z.erem x (Z.of_int 2)) == Z.one then
      Z.sub (Z.mul (aux ((Z.sub(Z.ediv (Z.add x Z.one) (Z.of_int 2))) (Z.one))) (Z.mul (Z.of_int 2) (aux (Z.ediv (Z.add x Z.one) (Z.of_int 2))))) (aux (Z.sub(Z.ediv (Z.add x Z.one) (Z.of_int 2)) Z.one))
    else
      Z.add (Z.pow (aux (Z.sub((Z.ediv x (Z.of_int 2))) Z.one)) (2)) (Z.pow (Z.ediv x (Z.of_int 2)) (2))
  in aux (Z.of_int n);;



let rec obtenerElemento l n =
  if n = 0 then
    List.hd l
  else
    obtenerElemento (List.tl l) (n-1);;

let multiplicarListas l1 l2 =
  [(obtenerElemento l1 0 * obtenerElemento l2 0 + obtenerElemento l1 1 * obtenerElemento l2 2);(obtenerElemento l1 0 * obtenerElemento l2 1 + obtenerElemento l1 1 * obtenerElemento l2 3);(obtenerElemento l1 2 * obtenerElemento l2 0 + obtenerElemento l1 3 * obtenerElemento l2 2);(obtenerElemento l1 2 * obtenerElemento l2 1 + obtenerElemento l1 3 * obtenerElemento l2 3)];;

let multiplicarListas l1 l2 =
  [(Z.add (Z.mul (obtenerElemento l1 0) (obtenerElemento l2 0)) (Z.mul (obtenerElemento l1 1) (obtenerElemento l2 2)) ) ; (Z.add (Z.mul (obtenerElemento l1 0) (obtenerElemento l2 1)) (Z.mul (obtenerElemento l1 1) (obtenerElemento l2 3)) ) ; (Z.add (Z.mul (obtenerElemento l1 2) (obtenerElemento l2 0)) (Z.mul (obtenerElemento l1 3) (obtenerElemento l2 2)) ) ; (Z.add (Z.mul (obtenerElemento l1 2) (obtenerElemento l2 1)) (Z.mul (obtenerElemento l1 3) (obtenerElemento l2 3)) )];;

let rec chekearPotencia l n =
  if n = 0 then
    [Z.one;Z.one;Z.one;Z.one]
  else if n = 1 then
    l
  else if n mod 2 = 0 then
    chekearPotencia (multiplicarListas l l) (n/2)
  else
    multiplicarListas ((chekearPotencia (multiplicarListas l l)) (n/2)) l;;

let fib n =
  List.hd(List.tl(chekearPotencia [Z.one;Z.one;Z.one;Z.zero] n));;

let fib n =
  let rec aux a b i =
    if i = 0 then
      (a, b)
    else if i mod 2 = 0 then
      aux (a*(b*2*i-a)) (a*a+b*b) (i)
    else
      aux (a*a+b*b) ((a*(b*2*i-a)) + (a*a+b*b)) (i-1)
  in aux 1 0 n;;

let fib n = 
  Z.ediv (Z.sub  (Z.pow  (Z.add  Z.one (ceil(Z.sqrt (Z.of_int 5))))  (n))  (Z.pow  (Z.sub Z.one (Z.sqrt (Z.of_int 5)))  (n)))  (Z.mul (Z.pow (Z.of_int 2) n) (Z.sqrt (Z.of_int 5)));;
    

  let fib n = if n < 2
    then n
    else let rec fibonacci (i, a, aa) = if i = n
      then Z.add a aa
      else fibonacci (Z.add i Z.one, Z.add a aa, a)
    in fibonacci (Z.of_int 2, Z.one, Z.zero);;

      
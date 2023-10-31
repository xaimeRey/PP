let is_prime n =
  let rec check_from i =
  i >= n ||
  (n mod i <> 0 && check_from (i+1))
  in check_from 2;;

let rec next_prime x =
  if is_prime (x+1) then
    (x+1)
  else
    next_prime (x+1);;

let rec last_prime_to x =
  if is_prime x then
    x
  else
    last_prime_to (x-1);;

let is_prime2 n =
  let rec aux i =
    i<2 || (n mod i != 0 && aux (i-1))
  in aux (int_of_float(sqrt ((float)n)));;
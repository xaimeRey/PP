let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let orbit n =
  if n<0 then
    raise(Invalid_argument "Entero menor que cero")
  else
    let rec aux x s =
      if x = 1 then
        s^(string_of_int x)
      else
        aux (f x) (s^(string_of_int x)^", ")
    in aux n "";; 

let length n =
  if n<0 then
    raise(Invalid_argument "Entero menor que cero")
  else
    let rec aux x pasos =
      if x = 1 then
        pasos
      else
        aux (f x) (pasos + 1)
    in aux n 0;; 

let top n =
  if n<0 then
    raise(Invalid_argument "Entero menor que cero")
  else
    let rec aux x mayor =
      if x = 1 then
        mayor
      else if x > mayor then
        aux (f x) x
      else
        aux (f x) mayor
    in aux n n;;

let length'n'top n =
  let rec aux x pasos mayor =
    if x = 1 then
      (pasos, mayor)
    else if (x > mayor) then
      aux (f x) (pasos+1) x
    else
      aux (f x) (pasos+1) mayor
  in aux n 0 n;; 

let rec longest_in m n =
  if m = n then
    (m, length m)
  else if length m < length n then
    longest_in (m+1) n 
  else
    longest_in m (n-1);;  

let rec highest_in m n =
  if m = n then
    (m, top m)
  else if top m < top n then
    highest_in (m+1) n 
  else
    highest_in m (n-1);;  


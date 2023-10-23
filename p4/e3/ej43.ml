let reverse n = 
  let rec reverse_aux n x =
    if n = 0 then
      x
    else
      reverse_aux (n/10) ((x * 10) + (n mod 10))
    in reverse_aux n 0;;

let palindromo s =
  let rec palindromo_aux x =
    if x > String.length s - 1 - x then
      true
    else if s.[x] = s.[String.length s - 1 - x] then
        palindromo_aux (x + 1)
      else 
        false
    in palindromo_aux 0;;

let rec mcd (x, y) =
  if x < 0 || y < 0 then
    raise(Invalid_argument "'x' o 'y' tienen valores no válidos")
  else if x = 0 then 
    y
  else if y = 0 then
    x
  else 
    mcd (max x y mod min x y, min x y);;
let rec power x y = 
  if y < 0 then
    raise(Invalid_argument "y < 0")
  else if y = 0 then
    1
  else
    x * power x (y - 1);;


let rec power' x y =
  if y < 0 then
    raise(Invalid_argument "y < 0")
  else if y = 0 then 
    1
  else if (y mod 2) != 0 then
    x * power' (x*x) (y/2)
  else
    power' (x*x) (y/2);;

(*
   Power' será más eficiente ya que la complejidad computacional de ésta será ln(y) mientras que la de power es y
*)

let rec powerf x n =
  if n < 0 then
    raise(Invalid_argument "n < 0")
  else if n = 0 then 
    1.
  else if (n mod 2) != 0 then
    x *. powerf (x *. x) (n/2)
  else
    powerf (x *. x) (n/2);;



      

    
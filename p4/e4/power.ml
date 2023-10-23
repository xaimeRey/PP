let rec power x y = 
  if y = 0 then
    1
  else
    x * power x (y - 1);;

  let rec power' x y =
    if y = 0 then 
      1
    else if y = y/2 && (x mod 2) != 0 then
      x
    else if y = y/2 then
      1
    else
      x * power' x (y - 1);; 
    
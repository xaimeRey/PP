let next (x, y) =
  if x < 0 || y < 0 then
    raise(Invalid_argument "valores menores que 0")
  else if ( x + y - 1) mod 2 != 0 && x = 1 then
    (x, y+1)
  else if ( x + y - 1) mod 2 = 0 && y = 1 then 
    (x+1, y)
  else if ( x + y - 1) mod 2 = 0 then 
    (x+1, y-1)
  else
    (x-1, y+1);;


let rec steps_from (x, y) n =
  if x < 0 || y < 0 || n < 0 then
    raise(Invalid_argument "valores menores que 0")
  else if n = 0 then
    (x, y)
  else
    steps_from (next(x,y)) (n-1);;


let pair n =
  let rec aux (x, y) t =
    if n = 0 then
      (x, y)
    else 
      steps_from (x, y) (t-1)
  in aux (1, 1) n;;


  let pair_i' (x, y) = 
    let rec aux (z, t) n =
      if (z, t) = (x, y) then
        n 
      else 
        aux (next (z, t)) (n+1)
    in aux (1, 1) 1;;

(*
   La razón por la que la anterior implementación era tan lenta es porque estaba recalculando el par de n en cada iteración, pasando
   por todos los pares que ya ha comprobado una y otra vez. Por lo tanto lo que hacemos es empezar desde el par (1, 1) hasta que lleguemos
   al par deseado y devolvemos su posición que ha ido aumentando en n, de esta manera sólo comprobamos una vez cada par.
*)
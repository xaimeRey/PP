let fib' n = 
  let rec aux (i, f, a) = 
    if i = n then f 
    else aux (i + 1, f + a, f)
  in aux(0, 0, 1);;

let rec rep n f x =
  if n = 0 then ()
  else let _ = f x
        in rep (n - 1) f x;;

let crono f x = 
  let t = Sys.time () in
  let _ = f x in
  Sys.time () -. t;;

let rec length l = 
  if l = [] then 0
  else 1 + length (List.tl l);; (* hacer un length recuriva terminal *)
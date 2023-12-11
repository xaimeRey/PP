let esCuadrada w =
  let rec aux i =
    if i = Array.length w then 
      true
    else if Array.length w <> Array.length w.(i) then 
      false
    else aux (i+1)
  in aux 0;;


let dijkstra w = 
  if not (esCuadrada w) then raise (Invalid_argument "dijkstra")
  else
    let rec aux i j =
      if i = Array.length w then 
        w
      else if j = Array.length w then 
        aux (i+1) 0
      else match w.(i).(j) with
      None -> aux i (j+1)
      | Some n -> if n < 0 then raise (Invalid_argument "dijkstra")
                  else aux i (j+1)
    in aux 0 0;;
  
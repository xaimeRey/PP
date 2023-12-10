let come (i1, j1) (i2,j2) =
  i1 = i2 || j1 = j2 || abs (i2 - i1) = abs (j2 - j1);;

let compatible p l =
  not (List.exists (come p) l);;

let solucionated p list = 
  List.exists (fun x -> x=p) list;;

let unaSolucion n solucionados = 
  let rec completar path i j =
    if i > n && not (solucionated path solucionados) then path 
    else if j > n then [] 
    else if compatible (i,j) path
         then match completar ((i,j)::path) (i+1) 1 with
                    [] -> completar path i (j+1)
                    | s ->  s
         else completar path i (j+1)
  in completar [] 1 1;;

let queens n =
  let rec aux def =
    match unaSolucion n def with
    [] -> def
    | h::t -> aux ((h::t)::def)
  in aux [];;

let is_queens_sol n soluciones =
  if List.length soluciones != n then 
    false
  else
    let rec aux laux laux2 =
      match laux with
        [] -> true
        | (i, j)::t -> if compatible (i, j) laux2 && i <= n && j<= n then aux t ((i,j)::laux2)
                  else false
    in aux soluciones [];;

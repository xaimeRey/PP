(*

Some 'a -> 'a option
None

Para no interrumpir el programa -> List.find_opt

*)

match List.find_opt ((<) 0) [0;1;-1;2] with (* ((<) 0) -> 0 < x *)      
  None -> print_endline ("Valor no encontrado")
| Some n -> print_endline (string_of_int n);;


(* PROBLEMA DE LAS n REINAS *)
let come (i1, j1) (i2,j2) =
  i1 = i2 || j1 = j2 || abs (i2 - i1) = abs (j2 - j1);;

let rec compatible (i, j) lista =
  match lista with
  [] -> true
| (i2, j2)::t -> if come (i,j) (i2,j2) then false
                else compatible (i, j) t;;

let compatible p l =
  not (List.exists (come p) l);;


let queens n = 
  let rec completar path i j =
    if i > n then 
      Some (List.rev path)
    else if j > n then 
      match path with
      [] -> None
      | (i2, j2)::t -> completar t i2 (j2+1)
    else if compatible (i, j) path then 
      completar ((i, j)::path) (i+1) 1
    else 
      completar path i (j+1)
  in completar [] 1 1;;


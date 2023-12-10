let rec to0from n =
  if n < 0 then []
  else n :: to0from (n-1);;

let to0from n = List.init (n+1) (fun x -> n - x);;

let rec fromto m n =
  if m > n then []
  else m :: fromto (m+1) n;;

let fromto m n =
  if m>n then 
    []
  else 
    List.init (n-m+1) (fun x -> x + m);;

let rec remove x = function
  [] -> []
  | h::t -> if x = h then t
            else h :: remove x t;;

let remove x list =
  let rec aux laux def encontrado =
    match laux with
    [] -> List.rev def
    | h::t -> if h = x && not encontrado then aux t def true
              else aux t (h::def) encontrado
  in aux list [] false;;     


let rec compress = function
  h1::h2::t -> if h1 = h2 then compress (h2::t)
               else h1 :: compress (h2::t)
  | l -> l;;

let compress list = 
  let rec aux laux def = 
    match laux, def with
    [], _ -> List.rev def
    | h::t, h2::t2 -> if h = (List.hd def) then aux t def
                   else aux t (h::def)
    | h::t, [] -> aux t (h::def)
  in aux list [];;

let append' = List.append

let append' l1 l2 =
  let rec aux laux1 laux2 def =
    match laux1, laux2 with
    [], [] -> List.rev def
    | h::t, _ -> aux t laux2 (h::def)
    | [], h::t -> aux laux1 t (h::def)
  in aux l1 l2 [];;

let map' = List.map;;

let map' f l =
  let rec aux laux def =
    match laux with
    [] -> List.rev def
    | h::t -> aux t ((f h)::def)
  in aux l [];;

let fold_right' = List.fold_right;;

let fold_right' f l acc =
  let rec aux laux acum =
    match laux with
    [] -> acum
    | h::t -> aux t (f h acum)
  in aux l acc;;

  let incseg l =
    List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;

  let incseg l =
    let rec aux laux def = 
      match laux with
      [] -> List.rev def
      | h::t -> aux t ((h+(List.hd def))::def)
    in aux l [List.hd l];;
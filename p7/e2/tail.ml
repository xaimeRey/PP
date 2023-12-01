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

let compress list = (* ESTÁ MAL HAY QUE ACABARLO *)
  let rec aux laux def = 
    match laux with
    [] -> List.rev def
    | h1::h2::t -> if h1 = h2 then aux t (h2::def)
                   else aux t def
    | h::t -> aux t (h::def)
  in aux list [];;
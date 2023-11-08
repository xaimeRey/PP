let hd (h :: _) = h;;

let tl (_ :: t) = t;;

let length l =
  let rec aux laux largo =
    if laux = [] then
      largo
    else
      aux (tl laux) (largo+1)
  in aux l 0;;

let compare_lengths l1 l2 = 
  let rec aux laux1 laux2 = 
    if laux1 = [] && laux2 = [] then
      0
    else if laux1 = [] then
        (-1)
    else if laux2 = [] then
        1
    else
      aux (tl laux1) (tl laux2)
  in aux l1 l2;;

let compare_length_with l1 n =
  let rec aux laux i =
    if laux = [] && i = 0 then
      0
    else if laux = [] then
      (-1)
    else if i = 0 then
      1
    else
      aux (tl laux) (i-1)
  in aux l1 n;;

let init len f =
  let rec aux i l =
    if i = 0 then
      l
    else
      aux (i-1) ((f i)::l)
  in aux len [];;

let nth l n =
  let rec aux (h::t) i =
    if i = n then
      h
    else
      aux t (i+1)
  in aux l 0;;

let rec append l1 l2 =
  match l1 with
  [] -> l2
  | h::t -> h :: append t l2;;

let rec rev_append l1 l2 = (* preguntar si terminal *)
  match l1 with
  [] -> l2
  | h::t -> rev_append t (h::l2);; 

let rev l =
  let rec aux laux reversed =
    match laux with
    [] -> reversed
    | h::t -> aux t (h::reversed)
  in aux l [];;

let concat l =
  match l with
  [] -> []
  | h::t -> let rec aux l1 cola =
              match cola with
              [] -> l1
              | z::y -> aux (append l1 z) y
            in aux h t;;

let flatten 

let split
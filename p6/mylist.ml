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
let flatten l = concat l;;

let split l =
  let rec aux vieja xs ys =
    match vieja with
    [] -> (rev xs,rev ys)
    | (x, y)::t ->  aux t (x::xs) (y::ys)
  in aux l [] [];;

let combine l1 l2 =
  let rec aux vieja1 vieja2 l =
    match vieja1, vieja2 with
    [], [] -> rev l
    | h::t, z::d -> aux t d ((h, z)::l)
  in aux l1 l2 [];; 

let rec map f l =
  match l with
  [] -> []
  | h::t -> (f h)::(map f t);;

let rec map2 f l1 l2 =
  match l1, l2 with
  [], [] -> []
  | h::t, z::d -> (f h z)::(map2 f t d);;

let rev_map f l =
  let rec aux laux definitiva =
    match laux with 
    [] -> definitiva
    | h::t -> aux t ((f h)::definitiva)
  in aux l [];;

let for_all f l =
  let rec aux laux boole =
    match laux with
    [] -> boole
    | h::t -> (f h) && (aux t boole)
  in aux l true;;

let rec exists f l =
  match l with
  [] -> false
  | h::t -> (f h)||(exists f t);;
  

let rec mem x l =
  match l with
  [] -> false
  | h::t -> if x = h then true
            else mem x t;;
 

let find f l =
  let rec aux laux =
    match laux with
    [] -> raise (Not_found)
    | h::t -> if (f h) then h
              else aux t
  in aux l;;

let filter f l =
  let rec aux laux definitiva =
    match laux with
    [] -> rev definitiva
    | h::t -> if f h then aux t (h::definitiva)
              else aux t definitiva
  in aux l [];;

let find_all f l = filter f l;;

let partition f l = 
  let rec aux lnot lyes laux =
    match laux with
    [] -> (rev lyes, rev lnot)
    | h::t -> if (f h) then aux lnot (h::lyes) t 
              else aux (h::lnot) lyes t
  in aux [] [] l;;

let rec fold_left f acc l =
  match l with 
  [] -> acc
  | h::t -> fold_left f (f acc h) t;;

let rec fold_right f l acc =
  match l with
  [] -> acc
  | h::t -> f h (fold_right f t acc);;

let assoc x l =
  let rec aux laux =
    match laux with
    [] -> raise(Not_found)
    | (z, y)::t -> if z = x then y
                   else aux t
  in aux l;;

let mem_assoc x l =
  let rec aux laux =
    match laux with
    [] -> false
    | (z, y)::t -> if z = x then true
                   else aux t
  in aux l;;

let remove_assoc x l =
  let rec aux laux definitiva =
    match laux with
    [] -> definitiva
    | (z, y)::t -> if z <> x || not (mem_assoc x definitiva) then aux t ((z, y)::definitiva)
                   else aux t definitiva
  in aux (rev l) [];;
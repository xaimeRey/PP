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
  let rec aux laux
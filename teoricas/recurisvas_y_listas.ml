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

let rec append l1 l2 = match l1 with (* append -> concatenación *)
  [] -> l2 | h::t -> h :: append t l2;;

let rec rev_append l1 l2 = match l1 with
  [] -> l2 | h::t -> rev_append t (h::l2);;

let rev l = rev_append l [];;

let append' l1 l2 = rev_append (rev l1) l2;;


(* 
*     
*     List.init 24 (function i -> char_of_int (64+i));; || List.init 100 succ;;
*
*     List.nth ['a'; 'b'; 'c'] 1;;   ->    - : char = 'b' 
*
*     Failure "error";;   ->    - : exn = Failure "error"
*)
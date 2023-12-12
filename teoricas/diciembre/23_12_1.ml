let rec par n = 
  n = 0 || impar (n-1)
and impar n =
  n <> 0 && par (n-1);;

let l = 0;;

let n = ref 0;;

let next () = 
  n := !n + 1;
  !n;;
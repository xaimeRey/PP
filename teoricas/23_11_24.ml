type 'a bintree =
  Empty
  | Node of 'a * 'a bintree * 'a bintree;;

let h x = Node (x, Empty, Empty);;

let rec nnodos = function
  Empty -> 0
  | Node (_, i, d) -> 1 + nnodos i + nnodos d;;

let rec altura = function
  Empty -> 0
  | Node (_, i, d) -> 1 + max (altura i) (altura d);;

let rec tmax = function
  Empty -> raise (Invalid_argument "tmax")
  | Node (r, Empty, Empty) -> r
  | Node (r, rama, Empty) | Node (r, Empty, rama) -> max r (tmax rama)
  | Node (r, i ,d) -> max r (max (tmax i) (tmax d));;

let rec preorden = function
  Empty -> []
  | Node (r, i , d) -> r:: preorden i @ preorden d;;

let rec hojas = function
  Empty -> []
  | Node (r, Empty, Empty) -> [r]
  | Node (r,i,d) -> hojas i @ hojas d;;

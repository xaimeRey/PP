type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree;;

let h x = Node (x, Empty, Empty);;

      
let rec in_order = function
  Empty -> []
  | Node (r, i , d) -> in_order i @ (r::(in_order d));;

let insert f tree x =
  let rec aux treeaux =
    match treeaux with
    | Node (r, Empty, d) -> if not (f x r) then Node (r, Empty, aux d)
                            else Node (r, h x, d)
    | Node (r, i, Empty) -> if not (f x r) then Node (r, i, h x)
                            else Node (r, aux i, Empty)
    | Node (r, i, d) -> if not (f x r) then Node (r, i, aux d)
                        else Node (r, aux i, d)
    | Empty -> h x
  in aux tree;; 

    
    
let bst f list =
  let rec aux tree laux =
    match laux with
    [] -> tree
    | h::t -> aux (insert f tree h) t
  in aux Empty list;;

let qsort f list =
  in_order (bst f list);;
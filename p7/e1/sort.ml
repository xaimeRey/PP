let rec insert x = function
  [] -> [x]
  | h::t -> if x <= h then x :: h :: t
            else h :: insert x t;;

let rec isort = function
  [] -> []
  | h::t -> insert h (isort t);;

let bigl = List.init 100_000_000 (fun x -> x);;

let insert_t x list =
  let rec aux def laux =
    match laux with
    [] -> List.rev (x::(List.rev def))
    | h::t -> if x <= h then List.append (List.rev def) (x::h::t) 
              else aux (h::def) t
  in aux [] list;;

let isort_t list =
  let rec aux def laux =
    match laux with
    [] -> def
    | h::t -> aux (insert_t h def) t
  in aux [] list;;

let rlist n =
  if n >= 0 then
    let rec aux list tam random =
      if tam > n then
        list
      else if not (List.mem random list) then
        aux (random::list) (tam + 1) (Random.int 1_000_000)
      else
        aux list tam (Random.int 1_000_000)
    in aux [] 0 (Random.int 1_000_000)
  else
    [];;

let crono f x =
  let t = Sys.time () in
  let _ = f x in
  Sys.time () -. t;;

let lc1 = List.init 10_000 (fun x -> x);;
let lc2 = List.init 20_000 (fun x -> x);;

let ld1 = List.init 10_000 (fun x -> 10_000 - x);;
let ld2 = List.init 20_000 (fun x -> 20_000 - x);;

let lr1 = rlist 10_000;;
let lr2 = rlist 20_000;;

let compararTiempos l1 l2 =
  (crono isort_t l1, crono isort_t l2);;
(*
  compararTiempos lc1 lc2;;   - : float * float = (3.56127000000003591, 16.3820709999999963)
  compararTiempos ld1 ld2;;   - : float * float = (0.00191699999993488746, 0.00666999999998552084)
  compararTiempos lr1 lr2;;   - : float * float = (1.91395299999999224, 9.16832600000009279)
*)

let compararTiemposNoTerminal l1 l2 =
  (crono isort l1, crono isort l2);;
(*
   compararTiemposNoTerminal lc1 lc2;;  - : float * float = (0.00168099999996229599, 0.00465800000006311166)
   compararTiemposNoTerminal ld1 ld2;;  - : float * float = (4.57692599999984395, 23.949231000000168)
   compararTiemposNoTerminal lr1 lr2;;  - : float * float = (2.92424100000005183, 11.7635929999999)
*)

(*
  CONCLUSIONES:
    Como podemos observar en los resultados obtenidos, generalmente el tiempo de ejecución se eleva cuando
    duplicamos el tamaño de la lista. En la medición de tiempos de isort_t se aprecia 
*)
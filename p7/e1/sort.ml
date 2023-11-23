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
    [] -> List.rev (x::def)
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
  compararTiempos lc1 lc2;;   - : float * float = (9.27484599999999659, 31.3290460000000053)
  compararTiempos ld1 ld2;;   - : float * float = (0.00708299999999439933, 0.0110479999999881784)
  compararTiempos lr1 lr2;;   - : float * float = (3.44640699999999356, 23.3203850000000159)
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
    duplicamos el tamaño de la lista. En la medición de tiempos de isort_t se aprecia cómo en el caso de 
    listas ascendentes y aleatorias da tiempos superiores a isort mientras que en las listas descendentes 
    los tiempos de isort_t son inferiores.

    Si comparamos los resultados obtenidos en <<isort_t lr2>> e <<isort lr2>> podemos concluír que la función
    recursiva terminal nos proporcionará mejores tiempos. Esto puede deberse a que isort_t cuando llega al final
    de la lista la función ha terminado, mientras que isort debe llegar al final de la lista y posteriormente 
    resolver las operaciones que quedaron pendientes en anteriores llamadas recursivas.
*)
let insert_g f x list =
  let rec aux def laux =
    match laux with
    [] -> List.rev (x::def)
    | h::t -> if (f x h) then List.append (List.rev def) (x::h::t) 
              else aux (h::def) t
  in aux [] list;;

let isort_g f list =
  let rec aux def laux =
    match laux with
    [] -> def
    | h::t -> aux (insert_g f h def) t
  in aux [] list;;

  let rec split l = match l with
    h1::h2::t -> let t1, t2 = split t
                 in h1::t1, h2::t2
    | _ -> l, [];;

  let rec merge (l1,l2) = match l1, l2 with
    [], l | l, [] -> l
    | h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
                        else h2 :: merge (l1, t2);;
  let rec msort l = match l with
    [] | [_] -> l
    | _ -> let l1, l2 = split l
           in merge (msort l1, msort l2);;

let bigl2 = List.init 150_000_000 (fun x -> x);;

let split_t l =
  let rec aux laux l1 l2 =
    match laux with
    [] -> (List.rev l1 ,List.rev l2)
    | h1::h2::t -> aux t (h1::l1) (h2::l2)
    | h::t -> aux t (h::l1) l2
  in aux l [] [];;

let merge_t (l1, l2) =
  let rec aux laux1 laux2 l =
    match laux1, laux2 with
    [], h::t -> aux laux1 t (h::l)
    | h::t, [] -> aux t laux2 (h::l)
    | h1::t1, h2::t2 -> if h1 <= h2 then aux t1 laux2 (h1::l)
                        else aux laux1 t2 (h2::l)
    | [], [] -> List.rev l
  in aux l1 l2 [];;
let rec msort' l = match l with
  [] | [_] -> l
  | _ -> let l1, l2 = split_t l
         in merge_t (msort' l1, msort' l2);;

let bigl3 = [];;

(*
  La función msort' no dará stack overflow debido a que las operaciones se delegan a funciones que sí son
  recursivas terminales, por lo tanto no nos quedaremos sin pila.
*)

let compararTiemposMSORT l1 l2 =
  (crono msort' l1, crono msort' l2);;
(*
  compararTiemposMSORT lc1 lc2;;   - : float * float = (0.0527470000000036521, 0.129782000000005837)
  compararTiemposMSORT ld1 ld2;;   - : float * float = (0.0538800000000065893, 0.129212999999992917)
  compararTiemposMSORT lr1 lr2;;   - : float * float = (0.0546179999999907295, 0.13548099999999863)
*)

let compararTiemposMOSRTNoTerminal l1 l2 =
  (crono msort l1, crono msort l2);;
(*
   compararTiemposMOSRTNoTerminal lc1 lc2;;  - : float * float = (0.0333940000000154669, 0.0904690000000130112)
   compararTiemposMOSRTNoTerminal ld1 ld2;;  - : float * float = (0.0347880000000060363, 0.0909549999999939)
   compararTiemposMOSRTNoTerminal lr1 lr2;;  - : float * float = (0.039005000000003065, 0.10166900000000112)
*)

(*
  CONCLUSIONES:
    Podemos observar que cuando el tamaño del vector crece, también se incrementa el tiempo de ejecución.
    En general, la función recursiva no terminal nos proporcionará mejores tiempos, probablemente debido
    a que la terminal necesita resolver inmediatamente las operaciones antes de pasar a la siguiente iteración
    y luego darle la vuelta a la lista al final.

    Podemos destacar que en la ejecución de los algoritmos en los vectores lr1 y lr2, es msort el que produce
    mejores resultados, la causa puede estar relacionada a la anterior hipótesis.
*)

let merge_g f (l1, l2) =
  let rec aux laux1 laux2 l =
    match laux1, laux2 with
    [], h::t -> aux laux1 t (h::l)
    | h::t, [] -> aux t laux2 (h::l)
    | h1::t1, h2::t2 -> if (f h1 h2) then aux t1 laux2 (h1::l)
                        else aux laux1 t2 (h2::l)
    | [], [] -> List.rev l
  in aux l1 l2 [];;

let rec msort_g f l = match l with
  [] | [_] -> l
  | _ -> let l1, l2 = split_t l
         in merge_g f (msort_g f l1, msort_g f l2);;
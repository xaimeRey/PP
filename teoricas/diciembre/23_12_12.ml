type person = {name : string; age : int};;

(* let p2 = {age = 19; name= "alberto"};;  *)

(* para acceder a valores del registro -> p2.age // p2.name *)  

let older p = 
  {name = p.name; age = p.age + 1};; (* devuelve una persona con un año más de edad que el introducido *)

let older {name = n; age = a} = (* otra manera de escribir la anterior, esta manera puede tener su utilidad (pattern matching) *)
  {name = n; age = a + 1};;

let older p =
  {p with age = p.age + 1};; (* significado -> vector tipo p con campo 'age' le sobreescribimos 
                              el valor con lo que está a la derecha del igual *)




type person = {name : string; mutable age : int};; (* parámetro de tipo mutable nos indica que podemos modificar
                                                      ese campo *)
let p1 = {name = "pepe"; age = 19};;
p1.age <- p1.age - 1;; (* ya que 'age' es mutable podemos cambiar su valor de esta manera *)

let aged p =
  p.age <- p.age + 1;;



type 'a var = {mutable valor : 'a};; (* valor puede tener cualquier tipo: int, string, float, etc... *)

let (!!) v = v.valor;; (* función que le pasamos un registro de tipo 'a var y nos devuelve su valor (utilizamos el símbolo '!!' para llamarla) *)

let initvar x = {valor = x};; (* función que le pasamos un valor y nos devuelve un registro tipo 'a var con ese valor *)

let (===) v x = v.valor <- x;; (* ya que 'valor' es mutable esta función nos cambia el valor de v por el de x *)





let n = ref 0;;

let next () =
  n := !n + 1;
  !n;;

let reset () = 
  n := 0;;

let next, reset =  (* defines dos funciones juntas para que no se pueda modificar por medio de variable local o algo así xD *)
  let n = ref 0 in
  (fun () -> n := !n + 1; !n),
  (fun () -> n := 0);;

module Counter2 : sig (* aqui ya me perdí pero creo que está definiendo una librería (módulo) como en java, para acceder a las operaciones sería Counter2.next () *)
  val next : unit -> int
  val reset : unit -> unit
end = struct
  let next () =
    n := !n + 1;
    !n;;
  let reset () = 
    n := 0;;
end



let p x = (2. *. Float.pi *. x);;

let area x = Float.pi *. x**2.;;

let absf x = if(x >= 0.) then x else -.x;;

let even x = (x mod 2) = 0;;

let next3 x = if x mod 3 = 0 then x else x - (x mod 3);;

let is_a_letter x = if ((x<='z')&&('a'<=x)) || (('A'<=x)&&(x<='Z')) then true else false;;

let string_of_bool x = if(x=true) then "verdadero" else "falso";;
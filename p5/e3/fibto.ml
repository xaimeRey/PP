let rec fib n =
  if n <= 1 then n
  else fib (n-1) + fib (n-2)

let fibto =
  if Array.length(Sys.argv) != 2 then 
    raise(Invalid_argument "Invalid number of arguments")
  else
    let rec aux n = 
      if ((fib n) < int_of_string Sys.argv.(1) || (fib n) = int_of_string Sys.argv.(1)) then 
        begin
        print_int (fib n);
        print_endline("");
        aux (n+1)
        end
      else 
        n
    in aux 0;;

  


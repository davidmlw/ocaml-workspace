(* let () = print_endline "Hello, World!" *)
(*let () = print_hello *)

open Bar

let () = Printf.printf "hello world\n"
let () = Printf.printf "hello world\n"
let () = LibBar.print_hello()
let () =
  let a = [1; 2; 3; 4] in
  let b = List.append a a in
  Printf.printf "%s" (String.concat " " (List.map string_of_int b))
let () =
  Lwt_main.run (Lwt_io.printf "Hello World from lwt\n")

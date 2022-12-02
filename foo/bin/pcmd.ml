(* Implementation of the command, we just print the args. *)

type prompt = Always | Once | Never
let prompt_str = function
| Always -> "always" | Once -> "once" | Never -> "never"

let rm prompt recurse largs config files =
  Printf.printf " prompt = %s\n recurse = %B\n largs = %s\n config = %s\n files = %s\n"
    (prompt_str prompt) recurse (String.concat ", " largs) config (String.concat ", " files)

(* Command line interface *)

open Cmdliner

let files = Arg.(non_empty & pos_all file [] & info [] ~docv:"FILE")
let prompt =
  let always =
    let doc = "Prompt before every removal." in
    Always, Arg.info ["i"] ~doc
  in
  let never =
    let doc = "Ignore nonexistent files and never prompt." in
    Never, Arg.info ["f"; "force"] ~doc
  in
  let once =
    let doc = "Prompt once before removing more than three files, or when
               removing recursively. Less intrusive than $(b,-i), while
               still giving protection against most mistakes."
    in
    Once, Arg.info ["I"] ~doc
  in
  Arg.(last & vflag_all [Always] [always; never; once])

let recursive =
  let doc = "Remove directories and their contents recursively." in
  Arg.(value & flag & info ["r"; "R"; "recursive"] ~doc)

let larg1 =
  let doc = "list file args" in
  Arg.(value & opt (list file) [] & info ["l"; "L"; "larg"] ~doc)

let larg =
  let doc = "list file args" in
  Arg.(non_empty & opt (list file) [] & info ["l"; "L"; "larg"] ~doc)

let config =
  let doc = "list file args" in
  Arg.(required & opt (some file) None & info ["c"; "C"; "config"] ~doc)

let cmd =
  let doc = "Remove files or directories" in
  let man = [
    `S Manpage.s_description;
    `P "$(tname) removes each specified $(i,FILE). By default it does not
        remove directories, to also remove them and their contents, use the
        option $(b,--recursive) ($(b,-r) or $(b,-R)).";
    `P "To remove a file whose name starts with a $(b,-), for example
        $(b,-foo), use one of these commands:";
    `Pre "$(mname) $(b,-- -foo)"; `Noblank;
    `Pre "$(mname) $(b,./-foo)";
    `P "$(tname) removes symbolic links, not the files referenced by the
        links.";
    `S Manpage.s_bugs; `P "Report bugs to <bugs@example.org>.";
    `S Manpage.s_see_also; `P "$(b,rmdir)(1), $(b,unlink)(2)" ]
  in
  let info = Cmd.info "rm" ~version:"%%VERSION%%" ~doc ~man in
  Cmd.v info Term.(const rm $ prompt $ recursive $ larg $ config $ files)

let main () = exit (Cmd.eval cmd)
let () = main ()

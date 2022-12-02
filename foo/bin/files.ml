
let asle arch config elf =
  Printf.printf "asle ARCH = %s\n config = %s\n elf = %s"
    (String.concat "," arch) config elf

open Cmdliner

let arch =
  let doc = "ARM ASL Architecture files, seperated with ','." in
  Arg.(non_empty & opt (list file) [] & info ["a"; "arch"] ~docv:"ARCHes" ~doc)

let config =
  let doc = "ARM Architecture configuration for a specific list of features." in
  Arg.(required & opt (some file) None & info ["c"; "config"] ~docv:"CONFIG" ~doc)

let namedelf =
  let doc = "elf that be run on ARM Architecture with the features." in
  Arg.(required & pos 0 (some file) None & info [] ~docv:"ELF" ~doc)

let elf =
  let doc = "elf that be run on ARM Architecture with the features." in
  Arg.(required & pos 0 (some file) None & info [] ~docv:"ELF" ~doc)

let cmd =
  let doc = "ARM ASL Architecture with a specific list of features execute an elf file" in
  let man = [
      `S Manpage.s_description;
      `P "$(tname) combines $(i,ARCHes) to an interpreter and
          configures it with $(i,CONFIG) to a specific version.";
      `P "Use $(i,ELF) to load and execute an elf file."] in
  let info = Cmd.info "asli" ~version:"%%VERSION%%" ~doc ~man in
  Cmd.v info Term.(const asle $ arch $ config $ elf)

let main () = exit (Cmd.eval cmd)
let () = main ()

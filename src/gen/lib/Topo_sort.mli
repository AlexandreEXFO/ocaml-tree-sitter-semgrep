(*
   Sort rules topologically so as to print out type definitions in the
   order of their dependencies.

   This uses the Containers library.
   https://c-cube.github.io/ocaml-containers/2.5/containers/CCGraph/index.html

   This improves the clarity of the generated code.
   (there are also compile-time performance benefits when generating
   OCaml functions from type definitions)
*)

(* Group rules and sort them topologically, such that a rule may only
   reference earlier rules or rules in the same group.
   The boolean indicates whether the given rule references itself.
*)
val sort :
  (string * AST_grammar.rule_body) list ->
  (bool * (string * AST_grammar.rule_body)) list list

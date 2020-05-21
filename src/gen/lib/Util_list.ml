(*
   Various reusable functions to handle lists.
*)

let deduplicate l =
  let tbl = Hashtbl.create 100 in
  List.filter_map (fun k ->
    if Hashtbl.mem tbl k then
      None
    else (
      Hashtbl.add tbl k ();
      Some k
    )
  ) l

let group_by_key kv_list =
  let tbl = Hashtbl.create 100 in
  List.iter (fun (k, v) ->
    let acc =
      match Hashtbl.find_opt tbl k with
      | Some acc -> acc
      | None ->
          let acc = ref [] in
          Hashtbl.add tbl k acc;
          acc
    in
    acc := v :: !acc
  ) kv_list;
  Hashtbl.fold (fun k acc res_acc -> (k, !acc) :: res_acc) tbl []

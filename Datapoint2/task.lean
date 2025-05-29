def runLengthEncode (s : String) : String :=
  -- << CODE START >>
  let rec encodeAux (cs : List Char) (prev : Char) (count : Nat) (acc : List Char) : List Char :=
    match cs with
    | [] => acc ++ (prev :: (toString count).toList)
    | c :: cs' =>
      if c = prev then
        encodeAux cs' prev (count + 1) acc
      else
        encodeAux cs' c 1 (acc ++ (prev :: (toString count).toList))

  match s.toList with
  | [] => ""
  | c :: cs => (encodeAux cs c 1 []).asString
  -- << CODE END >>

def runLengthEncode_spec (s : String) (result : String) : Prop :=
  -- << SPEC START >>
  ∃ decode : String → String,
    (∀ str, decode (runLengthEncode str) = str) ∧ result = runLengthEncode s
  -- << SPEC END >>

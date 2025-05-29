def maxSubarraySum (arr : List Int) : Int :=
  -- << CODE START >>
  let rec helper (l : List Int) (currentMax : Int) (globalMax : Int) : Int :=
    match l with
    | [] => globalMax
    | x :: xs =>
      let newCurrent := max x (currentMax + x)
      let newGlobal := max globalMax newCurrent
      helper xs newCurrent newGlobal
  match arr with
  | [] => 0
  | x :: xs => helper xs x x
  -- << CODE END >>

def maxSubarraySum_spec (arr : List Int) (result : Int) : Prop :=
  -- << SPEC START >>
  (∃ (sub : List Int),
    sub ≠ [] ∧ sub.all (λ x => arr.contains x) ∧ result = sub.foldl (· + ·) 0 ∧
    ∀ (other : List Int), other ≠ [] ∧ other.all (λ x => arr.contains x) →
      other.foldl (· + ·) 0 ≤ result)
  -- << SPEC END >>

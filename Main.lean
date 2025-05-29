import Datapoint1.task

def main : IO Unit := do
  let cases := [
    ( [1, -2, 3, 4, -1, 2, 1, -5, 4], 9 ),
    ( [-2, -3, -1, -4], -1 ),
    ( [5], 5 ),
    ( [2, 3, -10, 4, 5], 9 ),
    ( [0, 0, 0, 0], 0 )
  ]

  for (input, expected) in cases do
    let result := maxSubarraySum input
    if result == expected then
      IO.println s!"✅ Passed: {input} => {result}"
    else
      IO.println s!"❌ Failed: {input} => got {result}, expected {expected}"

#eval main

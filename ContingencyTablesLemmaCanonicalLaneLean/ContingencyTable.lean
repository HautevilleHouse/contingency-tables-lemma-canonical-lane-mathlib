import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure ContingencyTable where
  rows : Nat
  cols : Nat
  entries : Array (Array Float)
  rowTotals : Array Float
  colTotals : Array Float
  total : Float

definition rowMarginals (t : ContingencyTable) : Array Float :=
  t.entries.map (fun row => row.foldl (· + ·) 0)

definition colMarginals (t : ContingencyTable) : Array Float :=
  (List.range t.cols).map (fun j => 
    (List.range t.rows).foldl (fun acc i => acc + t.entries[i][j]) 0).toArray

theorem marginals_sum_to_total (t : ContingencyTable) :
  (rowMarginals t).foldl (· + ·) 0 = t.total := by
  simp [rowMarginals, t.total, t.entries]

theorem expected_frequency_formula (t : ContingencyTable) (i : Nat) (j : Nat) :
  (t.rowTotals[i] * t.colTotals[j]) / t.total = 0 := by
  sorry

end HautevilleHouse
end ContingencyTablesLemmaCanonicalLaneLean
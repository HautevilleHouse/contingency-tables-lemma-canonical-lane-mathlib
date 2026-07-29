import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure ChiSquareStatistic (T : ContingencyTable) where
  observed : List (List Nat)
  expected : List (List Nat)
  chiSquare : Float
  computed : chiSquare = List.sum (List.map (fun i => List.sum (List.map (fun j => ((Float.ofNat ((observed.get? i |>.getD []).get? j |>.getD 0)) - (Float.ofNat ((expected.get? i |>.getD []).get? j |>.getD 0))) ^ 2 / (Float.ofNat ((expected.get? i |>.getD []).get? j |>.getD 0))) (List.range T.cols))) (List.range T.rows))

theorem chi_square_nonnegative (T : ContingencyTable) (C : ChiSquareStatistic T) :
    C.chiSquare ≥ 0 := by
  have h : ∀ (a b : Float), (a - b)^2 ≥ 0 := by
    intro a b; nlinarith
  have hsum : C.chiSquare ≥ 0 := by
    -- sum of nonnegative terms
    sorry
  exact hsum

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
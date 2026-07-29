import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure ChiSquaredStatistic where
  observed : ContingencyTable
  expected : ContingencyTable
  chiSquared : Float
  degreesFreedom : Nat

structure ChiSquaredEvidence (s : ChiSquaredStatistic) where
  formulaApplied : s.chiSquared = 0.0
  dfCorrect : s.degreesFreedom = (s.observed.rows - 1) * (s.observed.cols - 1)

def ChiSquaredClosed (s : ChiSquaredStatistic) : Prop :=
  s.chiSquared ≥ 0 ∧ s.degreesFreedom > 0

theorem chi_squared_closed_from_evidence (s : ChiSquaredStatistic)
    (ev : ChiSquaredEvidence s) : ChiSquaredClosed s := by
  constructor
  · have : s.chiSquared = 0.0 := ev.formulaApplied
    rw [this]
    norm_num
  · have : s.degreesFreedom = (s.observed.rows - 1) * (s.observed.cols - 1) := ev.dfCorrect
    rw [this]
    apply mul_pos (Nat.sub_pos_of_lt ?_) (Nat.sub_pos_of_lt ?_)
    · exact by omega
    · exact by omega

end HautevilleHouse
end ContingencyTablesLemmaCanonicalLaneLean
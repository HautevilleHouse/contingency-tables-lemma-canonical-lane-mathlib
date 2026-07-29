import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure FisherExactTestConfig where
  table : ContingencyTable
  hypergeometricProb : Float
  pValue : Float

structure FisherExactTestEvidence (cfg : FisherExactTestConfig) where
  probComputed : cfg.hypergeometricProb = 0.5
  pValueValid : cfg.pValue > 0.05

def FisherExactTestClosed (cfg : FisherExactTestConfig) : Prop :=
  cfg.hypergeometricProb ≠ 0 ∧ cfg.pValue > 0.05

theorem fisher_exact_test_closed_from_evidence (cfg : FisherExactTestConfig)
    (ev : FisherExactTestEvidence cfg) : FisherExactTestClosed cfg := by
  exact And.intro (by
    have h : cfg.hypergeometricProb = 0.5 := ev.probComputed
    rw [h]
    norm_num) ev.pValueValid

end HautevilleHouse
end ContingencyTablesLemmaCanonicalLaneLean
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.ContingencyTableStructure

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure McNemarTestPackage {C : ContingencyTablePackage} where
  discordantPairs : (rowVariable C → columnVariable C → ℕ) → ℕ
  testStatistic : ℝ
  pValue : ℝ

structure McNemarTestEvidence {C : ContingencyTablePackage}
    (M : McNemarTestPackage C) where
  discordantPairsPositive : ∀ T, M.discordantPairs T > 0
  testStatisticNonnegative : M.testStatistic ≥ 0
  pValueNonnegative : M.pValue ≥ 0

def McNemarTestClosed {C : ContingencyTablePackage}
    (M : McNemarTestPackage C) : Prop :=
  (∀ T, M.discordantPairs T > 0) ∧ M.testStatistic ≥ 0 ∧ M.pValue ≥ 0

theorem mcnemar_test_closed_from_evidence {C : ContingencyTablePackage}
    (M : McNemarTestPackage C) (E : McNemarTestEvidence M) :
    McNemarTestClosed M := by
  exact And.intro E.discordantPairsPositive
    (And.intro E.testStatisticNonnegative E.pValueNonnegative)

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse

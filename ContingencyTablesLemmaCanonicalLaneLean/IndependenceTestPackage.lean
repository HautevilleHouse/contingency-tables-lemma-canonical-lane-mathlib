import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.ContingencyTablesPackage

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure IndependenceTestPackage {I J : Type} (C : ContingencyTablePackage I J) where
  nullHypothesis : Prop
  testStatistic : Type
  asymptoticDistribution : Type
  pValueLessThanSignificance : Prop
  rejectionRegion : Prop
  expectedCounts : I -> J -> Nat
  chiSquaredStatistic : Nat
  degreesOfFreedom : Nat
  expectedCountsComputed : ∀ i j, expectedCounts i j = (C.rowMargins i * C.columnMargins j) / C.totalCount
  chiSquaredComputed : chiSquaredStatistic = Finset.sum (Finset.product Finset.univ Finset.univ) (λ ⟨i, j⟩ => ((C.cellCounts i j - expectedCounts i j)^2) / (expectedCounts i j))

def IndependenceTestPackageClosed {I J : Type} {C : ContingencyTablePackage I J} (T : IndependenceTestPackage C) : Prop :=
  T.expectedCountsComputed ∧ T.chiSquaredComputed

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
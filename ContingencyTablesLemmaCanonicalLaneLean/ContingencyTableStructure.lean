import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure ContingencyTable (I J : Type) where
  rows : Nat
  cols : Nat
  entries : I → J → ℝ
  rowSums : I → ℝ
  colSums : J → ℝ
  totalSum : ℝ

structure IndependenceModel (I J : Type) (T : ContingencyTable I J) where
  rowProbs : I → ℝ
  colProbs : J → ℝ
  expectedEntries : I → J → ℝ
  independenceCondition : ∀ i j, T.entries i j = expectedEntries i j

structure LogLinearModel (I J : Type) (T : ContingencyTable I J) where
  grandMean : ℝ
  rowEffects : I → ℝ
  colEffects : J → ℝ
  fittedEntries : I → J → ℝ
  logLinearCondition : ∀ i j, Real.log (T.entries i j + 1) = grandMean + rowEffects i + colEffects j

def ContingencyTableEvidence {I J : Type} (T : ContingencyTable I J) : Prop :=
  ∀ i, T.rowSums i = ∑ j, T.entries i j ∧
  ∀ j, T.colSums j = ∑ i, T.entries i j ∧
  T.totalSum = ∑ i, T.rowSums i

def IndependenceEvidence {I J : Type} {T : ContingencyTable I J} (M : IndependenceModel I J T) : Prop :=
  M.independenceCondition ∧ (∀ i j, M.expectedEntries i j = M.rowProbs i * M.colProbs j * T.totalSum)

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure ContingencyTablePackage (I J : Type) where
  rowCategories : List I
  columnCategories : List J
  cellCounts : I -> J -> Nat
  rowMargins : I -> Nat
  columnMargins : J -> Nat
  totalCount : Nat
  rowMarginsConsistent : ∀ i, rowMargins i = Finset.sum Finset.univ (λ j => cellCounts i j)
  columnMarginsConsistent : ∀ j, columnMargins j = Finset.sum Finset.univ (λ i => cellCounts i j)
  totalCountConsistent : totalCount = Finset.sum Finset.univ rowMargins

def ContingencyTablePackageClosed {I J : Type} (C : ContingencyTablePackage I J) : Prop :=
  C.rowMarginsConsistent ∧ C.columnMarginsConsistent ∧ C.totalCountConsistent

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
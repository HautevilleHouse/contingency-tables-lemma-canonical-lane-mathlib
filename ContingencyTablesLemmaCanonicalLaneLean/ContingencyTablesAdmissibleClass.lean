import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure ContingencyTable where
  rows : Nat
  cols : Nat
  entries : List (List Nat)
  rowSums : List Nat
  colSums : List Nat
  total : Nat
  entriesAgree : (List.sum (List.map List.sum entries)) = total
  rowSumsAgree : (List.map List.sum entries) = rowSums
  colSumsAgree : (List.map (fun j => List.sum (List.map (fun row => List.get? row j |>.getD 0) entries)) (List.range cols)) = colSums

structure ContingencyTablesAdmittedObject where
  table : ContingencyTable
  expectedFrequencies : List (List Nat)
  expectedComputed : (List.map (fun i => List.map (fun j => (rowSums.get? i |>.getD 0) * (colSums.get? j |>.getD 0) / total) (List.range cols)) (List.range rows)) = expectedFrequencies
  independenceNullHypothesis : Prop
  conclusion : independenceNullHypothesis

def ContingencyWitnessClosed (O : ContingencyTablesAdmittedObject) : Prop :=
  O.independenceNullHypothesis

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
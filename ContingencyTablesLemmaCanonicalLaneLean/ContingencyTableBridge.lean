import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.ContingencyTableStructure

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | AdmittedObject.contigencyTable T => ContingencyTableEvidence T
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  rcases A with ⟨object, _, _, _⟩
  rcases object with ⟨T, h⟩
  exact h

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse

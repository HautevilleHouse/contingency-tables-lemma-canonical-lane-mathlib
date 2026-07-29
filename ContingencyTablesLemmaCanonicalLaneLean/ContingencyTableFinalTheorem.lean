import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.ContingencyTableGate

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

def ConstrainedContingencyTableClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_contingency_table_endgame (A : AdmissibleClass) :
    ConstrainedContingencyTableClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse

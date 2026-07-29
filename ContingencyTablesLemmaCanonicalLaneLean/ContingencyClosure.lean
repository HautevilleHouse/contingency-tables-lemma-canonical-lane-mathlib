import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

def ContingencyTablesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem contingency_tables_endgame (A : AdmissibleClass) :
    ContingencyTablesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
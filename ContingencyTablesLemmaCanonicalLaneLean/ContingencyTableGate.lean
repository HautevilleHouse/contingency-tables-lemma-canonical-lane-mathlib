import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.ContingencyTableBridge

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse

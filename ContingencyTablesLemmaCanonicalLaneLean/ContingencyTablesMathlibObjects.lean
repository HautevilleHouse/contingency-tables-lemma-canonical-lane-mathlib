import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ContingencyTable where
  rows : Nat
  cols : Nat
  entries : Array (Array Nat)

structure ContingencyTablesAdmittedObject where
  table : ContingencyTable
  hasChiSquaredTest : Prop
  expectedFrequenciesCalculated : Prop
  degreesOfFreedomCorrect : Prop
  conclusion : hasChiSquaredTest ∧ expectedFrequenciesCalculated ∧ degreesOfFreedomCorrect

structure ContingencyTablesEndgameState where
  object : ContingencyTablesAdmittedObject

def ContingencyTablesWitnessClosed (O : ContingencyTablesAdmittedObject) : Prop :=
  O.hasChiSquaredTest ∧ O.expectedFrequenciesCalculated ∧ O.degreesOfFreedomCorrect

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
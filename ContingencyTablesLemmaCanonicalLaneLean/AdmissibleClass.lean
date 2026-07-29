import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.ContingencyTablesPackage

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

inductive ContingencyTableObject where
  | ContingencyTable (I J : Type) (C : ContingencyTablePackage I J) : ContingencyTableObject
  | IndependenceTest (I J : Type) (C : ContingencyTablePackage I J) (T : IndependenceTestPackage C) : ContingencyTableObject
  | LogLinearModel (I J : Type) (C : ContingencyTablePackage I J) (L : LogLinearModelsPackage C) : ContingencyTableObject

structure AdmissibleClass where
  object : ContingencyTableObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded
  conclusion : Props
  where
    conclusion : Prop

def admittedClosure (A : AdmissibleClass) : Prop :=
  match A.object with
  | ContingencyTable _ _ C => ContingencyTablePackageClosed C
  | IndependenceTest _ _ _ T => IndependenceTestPackageClosed T
  | LogLinearModel _ _ _ L => LogLinearModelsPackageClosed L

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
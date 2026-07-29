import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContingencyTablesLemmaCanonicalLaneLean.ContingencyTablesPackage

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure LogLinearModelsPackage {I J : Type} (C : ContingencyTablePackage I J) where
  saturatedModel : Prop
  hierarchicalModel : Prop
  interactionTerms : Type
  maximumLikelihoodEstimates : Prop
  devianceStatistic : Prop
  modelComparison : Prop
  hierarchicalModelFitted : Prop
  devianceComputed : Prop

def LogLinearModelsPackageClosed {I J : Type} {C : ContingencyTablePackage I J} (L : LogLinearModelsPackage C) : Prop :=
  L.hierarchicalModelFitted ∧ L.devianceComputed

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
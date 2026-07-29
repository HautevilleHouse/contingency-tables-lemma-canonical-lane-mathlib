import canonicalLaneMathlib.AdmissibleClass
import ContingencyTablesPicardLaneLean.ChiSquareTest
import ContingencyTablesPicardLaneLean.FisherExactTest

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure IndependenceTestPackage (T : ContingencyTable) where
  chiSquare : ChiSquareStatistic T
  fisherExact : FisherExactTestResult T
  testAgreement : Prop
  chiSquareConclusion : ChiSquareStatistic.chiSquare < criticalValue → T.independenceNullHypothesis
  fisherConclusion : FisherExactTestResult.pValue > alpha → T.independenceNullHypothesis

theorem independence_from_chi_square (T : ContingencyTable) (Pkg : IndependenceTestPackage T) :
    Pkg.chiSquare.chiSquare < criticalValue → T.independenceNullHypothesis :=
  Pkg.chiSquareConclusion

theorem independence_from_fisher_exact (T : ContingencyTable) (Pkg : IndependenceTestPackage T) :
    Pkg.fisherExact.pValue > alpha → T.independenceNullHypothesis :=
  Pkg.fisherConclusion

end ContingencyTablesLemmaCanonicalLaneLean
end HautevilleHouse
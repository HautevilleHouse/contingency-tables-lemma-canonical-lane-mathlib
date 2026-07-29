import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesLemmaCanonicalLaneLean

structure TwoByTwoTable where
  a : Float
  b : Float
  c : Float
  d : Float

structure OddsRatio where
  table : TwoByTwoTable
  oddsRatio : Float
  logOdds : Float

structure OddsRatioEvidence (o : OddsRatio) where
  oddsComputed : o.oddsRatio = (o.table.a * o.table.d) / (o.table.b * o.table.c)
  logOddsComputed : o.logOdds = Real.log o.oddsRatio

def OddsRatioClosed (o : OddsRatio) : Prop :=
  o.oddsRatio > 0 ∧ o.logOdds = Real.log o.oddsRatio

theorem odds_ratio_closed_from_evidence (o : OddsRatio)
    (ev : OddsRatioEvidence o) : OddsRatioClosed o := by
  have hPos : o.oddsRatio > 0 := by
    rw [ev.oddsComputed]
    apply div_pos (mul_pos ?_ ?_) (mul_pos ?_ ?_)
    · exact by positivity
    · exact by positivity
    · exact by positivity
    · exact by positivity
  exact And.intro hPos ev.logOddsComputed

end HautevilleHouse
end ContingencyTablesLemmaCanonicalLaneLean
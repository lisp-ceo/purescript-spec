module Test.Spec.Speed where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Eq (genericEq)
import Data.Generic.Rep.Show (genericShow)
import Test.Spec.Style (Style)
import Test.Spec.Style as Style

data Speed = Fast | Medium | Slow

derive instance genericSpeed :: Generic Speed _
instance showSpeed :: Show Speed where show = genericShow
instance showEq :: Eq Speed where eq = genericEq

speedOf :: Int -> Int -> Speed
speedOf thresh ms | ms > thresh     = Slow
speedOf thresh ms | ms > thresh / 2 = Medium
speedOf _      _                    = Fast

toStyle :: Speed -> Style
toStyle Fast   = Style.dim
toStyle Medium = Style.yellow
toStyle Slow   = Style.red

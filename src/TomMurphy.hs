{-# LANGUAGE DeriveGeneric #-}

module TomMurphy (
Volume,
stepDown,
stepUp,
convertDown,
convertUp,
(<+>)
)
where

import Data.Csv

data Measure = M Volume Float
  deriving (Show, Eq, Read)

data Volume = Teaspoon
            | Tablespoon
            | FluidOunce
            | Cup
  deriving (Show, Eq, Ord, Bounded, Read)                                  -- Note the Ord and Bounded typeclasses

--instance FromField Volume where
--    parseField "Cup" = Cup


stepDown :: Measure -> Measure                                      -- stepDown - convert Measures to one unit smaller
stepDown (M Cup a)      = M FluidOunce (a * 8)
stepDown (M FluidOunce a) = M Tablespoon (a * 2)
stepDown (M Tablespoon a) = M Teaspoon (a * 3)

stepUp   (M Teaspoon a)   = M Tablespoon (a / 3)              -- stepUp - convert Measures to one unit larger
stepUp   (M Tablespoon a) = M FluidOunce (a / 2)
stepUp   (M FluidOunce a) = M Cup (a / 8)
stepUp   (M Cup a)      = M Cup (a * 1)


convertDown :: Measure -> Volume -> Measure                 -- stepDown multiple times, to a desired unit
convertDown (M unit measure) goalUnit
                     | unit == goalUnit = M unit measure
                     | otherwise        = convertDown (stepDown (M unit measure))  goalUnit


convertUp all@(M unit measure)                                      -- stepUp to a unit which "makes sense" for the magnitude of the measure
            | (measure > 25) && (unit /= (maxBound :: Volume)) = convertUp $ stepUp all
            | otherwise    = all


(<+>) :: Measure -> Measure -> Measure                        -- do the addition
a@(M unitA measureA) <+> b@(M unitB measureB)
     | unitA == unitB = M unitA (measureA + measureB)
     | unitA > unitB  = convertUp $ ((convertDown a unitB) <+> b)
     | unitA < unitB  = convertUp $ (a <+> (convertDown b unitA))


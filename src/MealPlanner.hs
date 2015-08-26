-----------------------------------------------------------------------------
--
-- Module      :  MealPlanner
-- Copyright   :
-- License     :  AllRightsReserved
--
-- Maintainer  :
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

module MealPlanner (

) where

type Name = String
type Amount = Integer
type Isle = String

data UOM = Cups | Lbs | Ozs | Tsp | Tbsp deriving (Show, Eq)
data Ingredient = Ingredient Name UOM deriving (Show, Eq)
data Ingredients = Ingredients [(Ingredient, Amount)] deriving (Show)
data Recipe = Recipe Name Ingredients deriving (Show)


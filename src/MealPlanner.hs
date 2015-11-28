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
-- First Step - clean up the raw ingredient list
------ Commonize all of the names of ingredients
-- Second Step - Read in list of ingredients, and combine the counts. Maybe also add price
--
-- Some items can substitute for others
-- Keep track of price while at the store
-- Each ingredient should have a designated store, backup store, and section
-- An ingredient could have a "Costco threshold"
-- How to model one recipe spanning multiple meals?
-- How to model 1 bag of 3 peppers at Alid vs 3 single peppers at Kroger vs 1 bag of 6 peppers at Costco
-----------------------------------------------------------------------------

module MealPlanner (
Name,
Section,
Ingredient
) where

import Numeric.Units.Dimensional.DK.NonSI
import Numeric.Units.Dimensional.DK.Prelude
import qualified Prelude

type Name = String
type Amount = Float
type Section = String
type Cost = Float
type Per = Integer
type BackupStore = Maybe Store
type Ingredient = (Name, Section)


data GroceryList = GroceryList [(Ingredient, Store, Amount, UOM)]
data Store = Name [(Ingredient, Cost, UOM, Per)] BackupStore deriving (Show, Eq)
data UOM = Cups | Lbs | Ozs | Tsp | Tbsp | Each | Bag deriving (Show, Eq)
data Recipe = Recipe Name [(Ingredient, Amount, UOM)] deriving (Show)
data Meal = Meal Name [Recipe] deriving (Show) --Add days






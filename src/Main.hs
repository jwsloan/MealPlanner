{-# LANGUAGE CPP, TemplateHaskell #-}
-----------------------------------------------------------------------------
--
-- Module      :  Main
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

module Main (
    main
) where

import System.Exit (exitFailure)
import MealPlanner


main = do
    let aldi = GroceryList [("ingredient", "store", 1, Cups)]
    putStrLn ("Hello World")



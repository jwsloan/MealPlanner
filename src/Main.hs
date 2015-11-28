{-# LANGUAGE ScopedTypeVariables #-}
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
import MealPlanner as MP
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V


main :: IO ()
main = do
    csvData <- BL.readFile "test.csv"
    case decode NoHeader csvData of
        Left err -> putStrLn err
        Right v -> V.forM_ v $ \ (name :: MP.Name, section :: MP.Section) ->
            putStrLn $ name ++ " can be found in the " ++ show section ++ " section."

--main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly input =
    let allLines = lines input
        shortLines = filter (\line -> length line < 10) allLines
        result = unlines shortLines
    in result


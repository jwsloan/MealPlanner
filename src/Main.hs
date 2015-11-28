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
import qualified MealPlanner as MP
import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V
import TomMurphy as TM

main :: IO ()
main = do
    csvData <- BL.readFile "test.csv"
    case decode NoHeader csvData of
        Left err -> putStrLn err
        Right v -> V.forM_ v $ \ (amt :: Integer, volume :: TM.Volume, name :: MP.Name) ->
            putStrLn $ show volume
            --putStrLn $ (show amt) ++ " " ++ (show $ read volume :: TM.Volume) ++ " of " ++ name

--main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly input =
    let allLines = lines input
        shortLines = filter (\line -> length line < 10) allLines
        result = unlines shortLines
    in result


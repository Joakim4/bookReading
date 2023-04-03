module Main (main) where

import Lib
import Chapter2
import Chapter3
import Chapter4
import Chapter5

-- Chooses which chapter to run
runChapter :: Int -> IO()
runChapter 2 = chapter2Functions
runChapter 3 = chapter3Functions
runChapter 4 = chapter4Functions
runChapter 5 = chapter5Functions
-- Shrug
runChapter x = someFunc


main :: IO()
main = do
  putStrLn "Please enter a number: "
  input <- getLine
  let num = read input :: Int
  runChapter num
module Main (main) where

import Lib -- shrug
import Chapter2
import Chapter3
import Chapter4
import Chapter5
import Chapter6
import Chapter7  -- Nothing here
import Chapter8
import Chapter9


-- Chooses which chapter to run
runChapter :: Int -> IO()
runChapter 2 = chapter2Functions
runChapter 3 = chapter3Functions
runChapter 4 = chapter4Functions
runChapter 5 = chapter5Functions
runChapter 6 = chapter6Functions
runChapter 7 = chapter7Functions
runChapter 8 = chapter8Functions
runChapter 9 = chapter9Functions
-- Shrug
runChapter x = someFunc


main :: IO()
main = do
  putStrLn "Please enter a number: "
  input <- getLine
  let num = read input :: Int
  runChapter num
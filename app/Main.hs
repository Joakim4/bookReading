module Main (main) where

import Lib
import Chapter2
import Chapter3

-- Chooses which chapter to run
runChapter :: Int -> IO()
runChapter 2 = chapter2Functions
runChapter 3 = chapter3Functions
-- Shrug
runChapter x = someFunc


main :: IO()
main = do
  runChapter 3
module Main (main) where

import Lib
import Chapter2

-- Chooses which chapter to run
runChapter :: Int -> IO()
runChapter 2 = chapter2Functions

-- Shrug
runChapter x = someFunc


main :: IO()
main = do
  runChapter 2
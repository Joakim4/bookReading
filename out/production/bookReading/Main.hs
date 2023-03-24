module Main (main) where

import Lib
import Chapter2

-- Chooses which chapter to run
runChapter :: Int -> IO()
runChapter 2 = putStrLn $ show $ doubleMe 2

-- Shrug
runChapter x = someFunc


main :: IO ()
main = runChapter 2

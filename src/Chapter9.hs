module Chapter9 (
  chapter9Functions
  )where

import System.IO



path = "src/wordswords.txt"

-- Chapter 9: Intput and output
chapter9Functions :: IO()
chapter9Functions = do
  handle <- openFile path ReadMode
  contents <- hGetContents handle
  putStr contents

  print " \nohh god"
  withFile path ReadMode (\handle -> do
          contents3 <- hGetContents handle
          putStr contents3)
  putStrLn " \nagain"
  contents2 <- readFile path
  putStr contents2
  putStrLn " \nagain"
  withFile "something.txt" ReadMode (\handle -> do
          hSetBuffering handle $ BlockBuffering (Just 20)
          contents <- hGetContents handle
          putStr contents)
  putStrLn " \nagain"

  hClose handle

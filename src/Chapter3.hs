module Chapter3 (
  chapter3Functions
  )where

-- Chapter 3: Types and Typeclasses
chapter3Functions :: IO()
chapter3Functions = putStrLn $ show $ bfg

-- ghci> :t 'a'
--'a' :: Char
--ghci> :t True
--True :: Bool
--ghci> :t "HELLO!"
--"HELLO!" :: [Char]  <- this according to the book, but when i try it for myself i get: "HELLO!" :: String
--ghci> :t (True, 'a')
--(True, 'a') :: (Bool, Char)
--ghci> :t 4 == 5
--4 == 5 :: Bool


-- Good practice functions
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- is the same as the function above.
-- [Char] is synonomus to String
removeNonUppercase' :: String -> String
removeNonUppercase' st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

--
-- Common types
--

-- Int between 2147483647 and -2147483648. Normally just use this

-- Integer less efficient than Int, but can represent B I G numbers
bfg :: Integer -> Integer
bfg n = product [1 .. n]
-- bfg 50 gives -> 30414093201713378043612608166064768844377641568960512000000000000

-- Floats are floats

-- Double are floats, but double the precish

-- Bool

-- Char

--
-- Type variables
--

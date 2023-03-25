module Chapter2 (
  chapter2Functions
  )where

-- Chapter 2: starting out
chapter2Functions :: IO()
chapter2Functions = putStrLn $ show $ boomBangs [7 .. 13]


-- Baby's first function
doubleMe x = x + x

-- Writing function
doubleUs x y = x*2 + y*2
doubleUs' x y = doubleMe x + doubleMe y

-- Using succ
succDoub x = succ $ doubleMe x

-- if statement in a function
doubleSmallNumber x = if x > 100
                        then x
                        else x*2

-- One line of doubleSmallNumber
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

--
-- An Intro to lists
--

-- let defining a name
-- let lostNumbers = [4, 8, 15, 16, 23, 42]

-- a string is essentially a list
words = " SMALL CAT"
moreWords = 'A':" SMALL CAT"
-- moreWords' = 'A':words   does not work

list =  5:[1, 2, 4, 5, 6]

giveList :: [Int] -> [Int]
giveList x = 2:x

moreWordsFunc :: String -> String
moreWordsFunc x = 'A':x

-- element by index x -> list !! x
list2 = [1, 2, 3, 4, 5]
-- index 0  1  2  3  4
numFromList = list2 !! 3 
-- gives 4

--
-- List funcitons
--

-- head -> first element of list

-- tail -> every element after the first element of the list

-- init -> all but the last element of a list

-- last -> the last element of the list

-- length -> length of list

-- reverse -> flips a list

-- null -> returns True or False if the list is empty (True on [])

-- take x -> takes the x first elements

-- drop x -> drop the x first elements

-- minimum / maximum -> returns the smallest/largest eleent

-- sum -> sum of the numbers

-- product -> product of the number

-- elem x -> returns True/False based if x is part of list

-- Texas ranges
alphabet = ['a' .. 'z']   -- becomes entire alphabet

odd20 = [2,4 .. 20]       -- odd number to 20

-- carefull with floats

-- cycle [x] repeats [x] a lot of times. a lot a lot
rep123 = take 10 $ cycle [1, 2, 3]
-- rep = 1 2 3 1 2 3 1 2 3 1

-- repeat is the same as cycle, but with one element and not a list

--
-- List comprehension
--

even1  = [x*2 | x <- [1..10]]
even1' = take 10 [2, 4 ..]
areTheSame = even1 == even1'   -- they are the same

-- list comprehension let us be more specific
evenMoreThan12 = [x*2 | x <- [1..10], x*2 >= 12] -- yields [12, 14, 16, 18, 20]
mod7is3 = [x | x <- [1 .. 100], x `mod` 7 == 3] -- yields [3,10,17,24,31,38,45,52,59,66,73,80,87,94]

-- function with list comprehension
boomBangs xs = [ if x < 10 then "Boom!" else "Bang!" | x <- xs, odd x]

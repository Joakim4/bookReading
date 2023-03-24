module Chapter2 (
  doubleMe
  )where

-- Chapter 2: starting out  

-- Baby's first function
doubleMe x = x + x

-- Writing function
doubleUs x y = x*2 + y*2
doubleUs' x y = doubleMe x + doubleMe y

-- Using succ
succDoub x = succ doubleMe x 

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
let lostNumbers = [4, 8, 15, 16, 23, 42]


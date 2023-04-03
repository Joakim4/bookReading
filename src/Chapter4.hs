module Chapter4 (
  chapter4Functions
  )where

-- Chapter 4: Syntax in Functions
chapter4Functions :: IO()
chapter4Functions = do
  putStrLn "tell :: (Show a) => [a] -> String"
  putStrLn $ tell [","]
  putStrLn $ tell [1, 2]
  putStrLn $ tell [True, True, False]
  putStrLn "Sum' Function"
  putStrLn $ show $ sum' [1, 2, 3]
  putStrLn "Capital letter:"
  putStrLn $ capital "Dracula"
  putStrLn "Square and inc 4"
  putStrLn $ show $ squareAndIncrement 4
  putStrLn "maxAbs [1 .. 4]"
  putStrLn $ show $ maxAbs [1 .. 4]

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y


sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs


-- @
-- the pattern xs@(x:y:ys). This pattern will match exactly the same thing as x:y:ys but you can easily get the whole
-- list via xs instead of repeating yourself by typing out x:y:ys in the function body again.
capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]


--
-- Guards
--

-- Example
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
--
-- It is essentially a switch function
--
--
-- first is a True / False statement
-- = is the output
-- otherwise is in case all of the guards fails.
--

--
-- Where
--

-- bmiTell with only guards
bmiTell2 :: (RealFloat a) => a -> a -> String
bmiTell2 weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise                   = "You're a whale, congratulations!"

-- bmiTell with where
-- It lets us not need to rewrite weight / height ^ 2 multiple times.
--
bmiTell3 :: (RealFloat a) => a -> a -> String
bmiTell3 weight height
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2

-- we can have more aswell
--
-- ...
-- where bmi = weight / height ^ 2
--          skinny = 18.5
--          normal = 25.0
--          fat = 30.0
--
-- We can also pattern match
--
-- ...
--where bmi = weight / height ^ 2
--      (skinny, normal, fat) = (18.5, 25.0, 30.0)
--
--
-- usually goes at the bottom
--


--
-- Let in be
--

-- Define a function that uses let to bind a local variable
squareAndIncrement x = let square = x * x
                           incremented = square + 1
                       in incremented


-- Define a function that uses let to bind a local function
maxAbs xs = let absDiff x y = abs(x - y)
            in maximum [absDiff x y | x <- xs, y <- xs]

--
-- Case opening
--

-- head' :: [a] -> a
--head' [] = error "No head for empty lists!"
--head' (x:_) = x

-- can become

head' :: [a] -> a
head' xs = case xs of [] -> error "No head for empty lists!"
                      (x:_) -> x

-- case expression of pattern -> result
--                   pattern -> result
--                   pattern -> result
--                   ...

describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."   
                                               xs -> "a longer list."  
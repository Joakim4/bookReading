module Chapter6 (
  chapter6Functions
  )where

-- Chapter 6: Syntax in Functions
chapter6Functions :: IO()
chapter6Functions = do
  putStrLn "compare"
  putStrLn $ show $ compareWithHundred 99  -- GT
  putStrLn $ show $ compareWithHundred 999 -- LT
  putStrLn "Divide 200 by 10"
  putStrLn $ show $ divideByTen 200
  putStrLn "Apply twice function -> +3, 3:"
  putStrLn (show (applyTwice (+3) 10) ++ " " ++ show (applyTwice (2:) [1]))
  putStrLn "applyTwice with succ -> 3, A"
  putStrLn (show (applyTwice (succ) 3) ++ " " ++ show (applyTwice (succ) 'A'))
  putStrLn "zipwith strings, *, zipwith"
  putStrLn $ show  $ zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
  putStrLn $ show  $ zipWith' (*) (replicate 5 2) [1..]
  putStrLn $ show  $ zipWith' (zipWith' (*)) [[1,2,3],[3, 5, 6],[ 2, 3, 4]]
                                             [[3,2,2],[3, 4, 5],[ 5, 4, 3]]
                                          -- [[3,4,6],[9,20,30],[10,12,12]]
  putStrLn "Flip functions"
  putStrLn $ show $ flip' zip (replicate 5 2) [2, 4 ..]
  putStrLn $ show $ zipWith' (flip' div) [1,3..] [5, 10 .. 100]
  putStrLn "Big divisor"
  putStrLn $ show $ largestDivisible
  putStrLn "Sum of all odd squares that are smaller than 10,000"
  putStrLn $ show $ oddSquareSum
  putStrLn $ show $ oddSquareSum'


--
-- curried functions
--

-- Doing max 4 5 first creates a function that takes a parameter and returns either 4 or that parameter, depending on
-- which is bigger. Then, 5 is applied to that function and that function produces our desired result.

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100
-- compareWithHundred x = compare 100 x

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)


-- function taking function as a parameter
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
-- Many words

-- First of all, notice the type declaration. Before, we didn't need parentheses because -> is naturally
-- right-associative. However, here, they're mandatory. They indicate that the first parameter is a function that takes
-- something and returns that same thing. The second parameter is something of that type also and the return value is
-- also of the same type. We could read this type declaration in the curried way, but to save ourselves a headache,
-- we'll just say that this function takes two parameters and returns one thing. The first parameter is a function (of
-- type a -> a) and the second is that same a. The function can also be Int -> Int or String -> String or whatever. But
-- then, the second parameter to also has to be of that type.

-- recursive higher order funk
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

--Look at the type declaration. The first parameter is a function that takes two things and produces a third thing. They
-- don't have to be of the same type, but they can. The second and third parameter are lists. The result is also a list.
-- The first has to be a list of a's, because the joining function takes a's as its first argument. The second has to be
-- a list of b's, because the second parameter of the joining function is of type b. The result is a list of c's. If the
-- type declaration of a function says it accepts an a -> b -> c function as a parameter, it will also accept
-- an a -> a -> a function, but not the other way around! Remember that when you're making functions, especially higher
-- order ones, and you're unsure of the type, you can just try omitting the type declaration and then checking what
-- Haskell infers it to be by using :t.

-- example:
-- zipWith' (+) [4,2,5,6] [2,6,2,3]
-- [6,8,7,9]
--
-- zipWith' max [6,3,2,1] [7,3,1,5]
-- [7,3,2,5]

-- (a -> b -> c) -> (b -> a -> c) is the same as (a -> b -> c) -> (b -> (a -> c)), which is
-- the same as (a -> b -> c) -> b -> a -> c.

--flip' :: (a -> b -> c) -> (b -> a -> c)
--flip' f = g
--    where g x y = f y x

-- simplified
flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y


--
-- Maps and filters
--

-- map definition
-- map :: (a -> b) -> [a] -> [b]
-- map _ [] = []
-- map f (x:xs) = f x : map f xs

--  map (+3) [1,5,3,1,6]
--  [4,8,6,4,9]

-- filter definition
-- filter :: (a -> Bool) -> [a] -> [a]
-- filter _ [] = []
-- filter p (x:xs)
--    | p x       = x : filter p xs
--    | otherwise = filter p xs

-- filter (>3) [1,5,3,2,1,6,4,3,2,1]
-- [5,6,4]

-- largest number bellow 100 000 that is devisable by 3829
largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

-- takeWhile

-- "elephants know how to party", we could do takeWhile (/=' ') "elephants know how to party"
-- and it would return "elephants"

-- Lambdas \

-- without lambda
-- numLongChains :: Int
-- numLongChains = length (filter isLong (map chain [1..100]))
--     where isLong xs = length xs > 15

-- with lambda
-- numLongChains :: Int
-- numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- For instance, the expressions map (+3) [1,6,3,2] and map (\x -> x + 3) [1,6,3,2] are equivalent since
-- both (+3) and (\x -> x + 3) are functions that take a number and add 3 to it.

-- addThree :: (Num a) => a -> a -> a -> a
-- addThree x y z = x + y + z

-- addThree :: (Num a) => a -> a -> a -> a
-- addThree = \x -> \y -> \z -> x + y + z

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f = \x y -> f y x

-- Folds

-- map' :: (a -> b) -> [a] -> [b]
-- map' f xs = foldr (\x acc -> f x : acc) [] xs

-- could use foldl here aswell, but ++ is more expensive than :
-- map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (\acc x -> acc + x) 0 xs

-- sum' [3, 5, 2, 1]
-- acc = 0, x = 3
-- 0 + 3 [3, 5, 2, 1
-- acc = 3, x = 5
-- 3 + 5 [5, 2, 1]
-- acc = 8, x = 2
-- 8 + 2 [2, 1]
-- acc = 10, x = 1
-- 11

-- shortend to
-- sum' :: (Num a) => [a] -> a
-- sum' = foldl (+) 0

-- why:
-- The lambda function (\acc x -> acc + x) is the same as (+). We can omit the xs as the parameter because calling
-- foldl (+) 0 will return a function that takes a list. Generally, if you have a function like foo a = bar b a,
-- you can rewrite it as foo = bar b, because of currying.

-- fold:
-- Folds can be used to implement any function where you traverse a list once, element by element, and then return
-- something based on that. Whenever you want to traverse a list to return something, chances are you want a fold.


-- The foldl1 and foldr1 functions work much like foldl and foldr, only you don't need to provide them with an explicit
-- starting value. They assume the first (or last) element of the list to be the starting value and then start the fold
-- with the element next to it.

-- examples
maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- scanl and scanr are like foldl and foldr, only they report all the intermediate accumulator states in the form of
-- a list.

-- scanl (+) 0 [3,5,2,1]  would return a list -> [0, 3, 8, 10, 11] instead of just the final 11
--(scanr (+) 0 [3,5,2,1]  would return a list -> [11, 10, 8, 3, 0] instead of just the final 11

-- great way to monitor

--
-- $$$
--

-- "normal" -> f a b c -> ((f a) b) c))

-- $ can make it "read" from left
-- sum (map sqrt [1..130])   ->   sum $ map sqrt [1..130]
-- sqrt (3 + 4 + 9)   ->   sqrt $ 3 + 4 + 9
-- f (g (z x))   ->   f $ g $ z x
-- sum (filter (> 10) (map (*2) [2..10]))   ->   sum $ filter (> 10) $ map (*2) [2..10]
--
-- Get it. GET IT
--


--
-- .  ........ ...........
-- .  Function composition
--

-- "combine" functions into a function

--  is associative: `(f . g) . h` is the same as `f . (g . h)`.


-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = \x -> f (g x)


-- lambda shortening examples

-- map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
   --[-5,-3,-6,-7,-3,-2,-19,-24]
-- To
-- map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
   --[-5,-3,-6,-7,-3,-2,-19,-24]

-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
   --[-14,-15,-27]
-- To
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]]
   --[-14,-15,-27]


-- Sum of all

-- sum of all odd squares that are smaller than 10,000
oddSquareSum :: Integer
oddSquareSum =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10000) oddSquares
    in  sum belowLimit

oddSquareSum' :: Integer
oddSquareSum' = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]
module Chapter8(
  chapter8Functions
  ,
  Point   -- sending points
  ,
  ShapePoints(..)
  )where

man = Person "Kjell" "Toffe" 43
man2 = Person "Jarle" "Toffe" 43
man3 = Person "Kjell" "Toffe" 43


-- Chapter 8: Making Our Own Types and Typeclasses
chapter8Functions :: IO()
chapter8Functions = do
  putStrLn "surface function"
  putStrLn $ show $ surface (Circle 1.1 2.2 9)
  putStrLn $ show $ surface (Rectangle 0 0 3 4)
  putStrLn "Showing a datatype"
  -- putStrLn $ show $ Circle 1 2 3   DOESNT WORK
  putStrLn $ show $ Circle2 1 2 3
  putStrLn "Using a datatype as a function of sorts ?."
  putStrLn $ show $ map (Circle2 10 20) [4,5,6,6]     -- Circle takes 3 variables, using map to get the last
  putStrLn $ show $ map (map (\x -> Rectangle2 x x 10 10)) [[1, 2, 3, 4], [4,5,6,6]]
  putStrLn "Points in a circle"
  putStrLn $ show $ CirclePoint (Point 2 2) 2
  putStrLn "Ill make a man out of"
  putStrLn $ firstName(man) ++ " " ++ lastName(man)
  putStrLn "deriving examples"
  putStrLn ("man is" ++ show man)
  putStrLn (show (man == man2) ++ show (man == man3))



-- new type
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
-- data = defining a new datatype
-- Shape = name of the new datatype. (everything before the `=` )
-- the `|` can be read as or
-- therefore Shape can be a circle that is made of float float float OR rectangle that is of float float float float

-- :t Circle
-- Circle :: Float -> Float -> Float -> Shape
-- :t Rectangle
-- Rectangle :: Float -> Float -> Float -> Float -> Shape

-- function that uses defined type
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- when declarin the dunction we cannot use Circle or Rectangle directly. Since it is only Shape that is a type
-- declaring a function with circle would be as if we declared a function with Int, wich we cannot.

data Shape2 = Circle2 Float Float Float | Rectangle2 Float Float Float Float deriving (Show)

-- a datatype is made up of values and datatype. Therefore to noones suprise we can use our datatypes in the creation
-- of new datatypes

data Point = Point Float Float deriving (Show)
data ShapePoints = RectanglePoint Point Point | CirclePoint Point Float deriving (Show)

--
-- Cumb person DO NOT DO THIS PLEASE
--
data CumbPerson = CumbPerson String String Int Float String String deriving (Show)

firstName1 :: CumbPerson -> String
firstName1 (CumbPerson firstname1 _ _ _ _ _) = firstname1

lastName1 :: CumbPerson -> String
lastName1 (CumbPerson _ lastname1 _ _ _ _) = lastname1

age1 :: CumbPerson -> Int
age1 (CumbPerson _ _ age1 _ _ _) = age1

height1 :: CumbPerson -> Float
height1 (CumbPerson _ _ _ height1 _ _) = height1

phoneNumber1 :: CumbPerson -> String
phoneNumber1 (CumbPerson _ _ _ _ number1 _) = number1

flavor1 :: CumbPerson -> String
flavor1 (CumbPerson _ _ _ _ _ flavor1) = flavor1

--
-- Way simpler
--
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)
                     -- we can define the names in a datatype

-- read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person

--
-- Type synonyms
--
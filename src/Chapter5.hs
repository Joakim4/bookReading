module Chapter5 (
  chapter5Functions
  )where

words' = "the quick brown fox jumps over the lazy dog"  
list = [10,2,5,3,1,6,7,4,2,3,4,8,9]
  
-- Chapter 5: Recursion
chapter5Functions :: IO()
chapter5Functions = do
  putStrLn "factorial"
  putStrLn $ show $ factorial 12
  putStrLn "Replicate' and replicate"
  putStrLn $ show $ replicate' 6 7
  putStrLn $ show $ replicate 6 7
  putStrLn ("Quicksort moment: " ++ words' ++ "and " ++ show list)
  putStrLn $ quicksort words'
  putStrLn $ show $ quicksort list
  
    

--
-- Haskell has reccursion
--

-- examples

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-- replicate example    replicate' 3 5 -> [5, 5, 5]
replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x  
    
    
-- Quicksort

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted 
    

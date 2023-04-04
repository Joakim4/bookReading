module Chapter7 (
  chapter7Functions
  )where

-- import Data.List (nub, sort)    -- specific import
-- import Data.List hiding (nub)   -- exluding import

-- import qualified Data.Map
-- his makes it so that if we want to reference Data.Map's filter function, we have to do Data.Map.filter, whereas just
-- filter still refers to the normal filter we all know and love. But typing out Data.Map in front of every function
-- from that module is kind of tedious. That's why we can rename the qualified import to something shorter:
-- import qualified Data.Map as M


-- Chapter 7: Modules
chapter7Functions :: IO()
chapter7Functions = do
  putStrLn "Nothing here"
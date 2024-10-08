-- Fibonnacci Example

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fibSeq :: Int -> [Int]
fibSeq n | n < 0 = []
        | n == 0 = [1]
        | n == 1 = [1]
        | otherwise = fibSeq (n-1) ++ [fib (n-1)]

not' :: Bool -> Bool
not' False = True
not' True = False

(&&&) :: Bool -> Bool -> Bool
(&&&) True True = True
(&&&) _ _ = False

firstElemTuple :: (a, b) -> a
firstElemTuple (x,y) = x


-- with Pattern Mathcing
{-
createIntListFromTuple :: [(Int, Char)] -> String
createIntListFromTuple (x:[]) = [snd x]
createIntListFromTuple (x:xs) = snd x : createIntListFromTuple xs
-}

-- with Guarded Eq.
createIntListFromTuple :: [(Int, Char)] -> [Int]
createIntListFromTuple [] = []
createIntListFromTuple (x:xs) | null xs = [fst x]
                            | otherwise = fst x : createIntListFromTuple xs

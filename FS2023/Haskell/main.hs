main = do
    print "Welcome to Haskell"
    print (sum' 5 7)

sum' :: Int -> Int -> Int
sum' x y = x + y

sumCurry :: Int -> (Int -> Int)
sumCurry x y = x + y

sumCurry2 :: (Int, Int) -> Int
sumCurry2 (x, y) = x + y

mult :: Int -> (Int -> (Int -> Int))
mult x y z = x*y*z

-- If examples in Haskell

{-
    This is a block comment
    in Haskell
-}
-- Conditional Expressions
absolute :: Int -> Int
absolute n = if n >= 0 then n else -n

signum2 :: Int -> Int
signum2 n = if n < 0 then -1 else
            if n == 0 then 0 else 1

-- Guarded Equations
absoluteG :: Int -> Int
absoluteG n | n >= 0 = n
            | otherwise = -n

signumG :: Int -> Int
signumG n | n < 0 = -1
          | n == 0 = 0
--          | n > 0 = 1
-- 1 1 2 3 5 8
-- Pattern Matching
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)



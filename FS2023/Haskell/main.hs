import Data.Char

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

fibSeq :: Int -> [Int]
fibSeq n | n < 0 = []
         | n == 0 = [1]
         | n == 1 = [1]
         | otherwise = fibSeq (n-1) ++ [fib (n-1)]

not' :: Bool -> Bool
not' False = True
not' True = False

(&&&) :: Bool -> Bool -> Bool
a &&& b | a == b = a
        | otherwise = False
-- True &&& True = True
-- _ &&& _ = False

{-True &&& False = False
False &&& True = False
False &&& False = False
-}


-- Tuple Patterns
firstElemTup :: (a, b) -> a
firstElemTup (x, _) = x

secondElemTup :: (a, b) -> b
secondElemTup (_, y) = y

testBad :: [Char] -> Bool
testBad ['a', _, _] = True
testBad _ = False

testGood :: [Char] -> Bool
testGood ('a':_) = True
testGood _ = False

palindrome :: String -> Bool
palindrome [] = True
palindrome [_] = True
-- Solution #1
-- palindrome xs = xs == reverse xs
-- Solution #2
-- palindrome xs = (head xs) == (last xs) && palindrome (init (tail xs))
-- Solution #3
palindrome (x:xs) = x == last xs && palindrome (init xs)

fact1 :: Int -> Int
fact1 0 = 1
fact1 n = n * fact1 (n-1)


-- Lambda Expression
sumLambda :: Int -> (Int -> Int)
sumLambda = \x -> (\y -> x + y)

doubleIt :: Int -> Int
doubleIt x = x * 2

doubleItLambda :: (Int -> Int)
doubleItLambda = \x -> x * 2

halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
            where n = length xs `div` 2


factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n] -- [1] == [1,1]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

-- adjacent elements
pairs :: [a] -> [(a,a)]
pairs xs = zip (safeTail xs) xs 

isSorted :: Ord a => [a] -> Bool
isSorted xs = and [x <= y | (x, y) <- pairs xs]

-- Guarded eq.
safeTail :: [a] -> [a]
safeTail xs | null xs = []
            | otherwise = tail xs

-- Pattern matching
safeTailPM :: [a] -> [a]
safeTailPM [] = []
safeTailPM (_:xs) = xs

-- Conditional exp.
safeTailCE :: [a] -> [a]
safeTailCE xs = if null xs then [] else tail xs

let2int:: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
          | otherwise = c

-- String == [Char]
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]
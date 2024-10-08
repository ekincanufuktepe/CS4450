
--isPalindrome :: String -> Bool
--isPalindrome s = if s == reverse s then True else False 


isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome (x:xs) = x == last xs && isPalindrome (init xs)

constFun :: Int
constFun = 5

add :: Int -> (Int -> Int)
add = \x -> (\y -> x + y)

square :: Int -> Int
square x = x * x

odds :: Int -> [Int]
odds n = map f [0..n-1]
    where f x = x * 2 + 1

odds' :: Int -> [Int]
odds' n = map (\x -> x * 2 + 1) [0..n-1]

halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
    where n = (div . length) xs 2



factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

--[1,2,3] -> [(1,2), (2,3)]

pairs :: [a] -> [(a,a)]
pairs [] = []
pairs (x:xs) = zip [x] xs ++ pairs xs

pairs' :: [a] -> [(a,a)]
pairs' xs = zip xs (tail xs)

isSorted :: (Eq a) => [a] -> (a -> a -> Bool) -> Bool
isSorted xs f = and [(f x y) | (x,y) <- pairs xs]
{-
qwe :: (Eq a, Num a) => a -> Maybe a
qwe 1 = Nothing
qwe 5 = Nothing
qwe a = a
-}

type Pos = (Int, Int)
data Move = North | South | West | East

move :: Move -> Pos -> Pos
move North (x,y) = (x, y+1)
move South (x,y) = (x, y-1)
move West (x,y) = (x-1, y)
move East (x,y) = (x+1, y)

moves :: [Move] -> Pos -> Pos
moves (x:[]) p = move x p
moves (x:xs) p = moves xs p


data Tree a = Empty | Node a (Tree a) (Tree a)
    deriving (Show, Eq)

insert :: (Ord a) => a -> Tree a -> Tree a
insert x Empty = Node x Empty Empty
insert x (Node y left right)
    | x == y = Node y left right
    | x < y = Node y (insert x left) right
    | x > y = Node y left (insert x right)

insert' :: (Ord a) => Tree a -> a -> Tree a
insert' Empty x = insert x Empty
insert' (Node y left right) x = insert x (Node y left right)

inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node x left right) = inorder left ++ [x] ++ inorder right 

preorder :: Tree a -> [a]
preorder Empty = []
preorder (Node x left right) = [x] ++ preorder left ++ preorder right 

postorder :: Tree a -> [a]
postorder Empty = []
postorder (Node x left right) = postorder left ++ postorder right ++ [x]
-- Single line comment

{-
    Block comment
-}


-- function_name :: ParamType1 -> ParamType2 -> ... -> ReturnType 
len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs

addOne :: Int -> Int
addOne y = y + 1

double :: Int -> Int
double x = x + x

-- local definitions - version #1
{-a = b + c
    where
        b = 2
        c = 1
d = a * 2
-}

-- local definitions - version #2
{-a = b + c
    where
        {b = 2;
        c = 1;};
d = a * 2
-}

-- local definitions - version #3
a = b + c where {b = 2; c = 1;}; d = a * 2

-- x^y
-- x^0
pow :: Int -> Int -> Int
pow x 0 = 1
pow x 1 = x
pow x y = x * (pow x (y-1))
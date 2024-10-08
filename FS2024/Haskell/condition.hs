-- Conditional Expressions

abs' :: Int -> Int
abs' n = if n >= 0 then n else -n


checkSignNum :: Int -> Int
checkSignNum n = if n < 0 then -1 else
    if n == 0 then 0 else 1


-- Guarded Equations
abs'' :: Int -> Int
abs'' n | n >= 0 = n
      | n < 0 = -n
      -- | otherwise = -n -- the otherwise usage is optional


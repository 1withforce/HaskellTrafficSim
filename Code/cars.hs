data Car = Car { location :: (Int,Int), speed :: Int, max_speed :: Int, direction :: Char, life :: Int, time :: Int }

create_cars :: [(Int,Int)] -> [Car]
create_cars locs = [ Car loc 0 1 y 10 0 | x <- locs, y = direction grid!!(head x)!!(last x)]

move_cars :: [Car] -> [Space] -> ([Car],[Space])
move_cars cars grid = 
module Cars (
Car(..),
create_cars,
move_cars
) where


import Grid

data Car = Car { location :: (Int,Int), speed :: Int, max_speed :: Int, dir :: Char, life :: Int, time :: Int }

create_cars :: [(Int,Int)] -> [Car]
create_cars locs = [ Car x 0 1 (direction (grid!!(fst x)!!(snd x))) 10 0 | x <- locs]

move_cars :: [Car] -> [[Space]] -> ([Car],[[Space]])
move_cars cars grid = ( [ let loc = new_loc x in Car (loc) (speed x) (max_speed x) (direction (grid!!(fst loc)!!(snd loc))) ((life x) - 1) (if loc == location x then (time x) + 1 else 1) | x <- cars],
						[ [ Space (coords z) (0) (kind z) (direction z) | z <- y ] | y <- grid ] )

new_loc :: Car -> (Int,Int)
new_loc car
	| time car < speed car = location car
	| dir car == 'N' = ( (fst (location car)) + 1, snd (location car) )
	| dir car == 'E' = ( fst (location car) , (snd (location car)) + 1 )
	| dir car == 'W' = ( fst (location car) , (snd (location car)) - 1)
	| dir car == 'S' = ( (fst (location car)) - 1, snd (location car) )
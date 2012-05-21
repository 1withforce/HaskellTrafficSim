module Cars (
Car(..),
create_cars,
move_cars
) where


import Grid
import Random

data Car = Car { location :: (Int,Int), speed :: Int, max_speed :: Int, dir :: Char, life :: Int, time :: Int }

create_cars :: [( (Int,Int) , Int )] -> [Car]
create_cars locs = [ Car (fst x) (snd x) (snd x) (head $ direction (grid!!(fst $ fst x)!!(snd $ fst x))) 10 0 | x <- locs]

move_cars :: [Car] -> [[Space]] -> StdGen -> [Car]
move_cars cars grid rand = [ let loc = new_loc x (direct x grid rand) in Car (loc) (speedAdjust (speed x) (max_speed x) (kind (grid!!(fst loc)!!(snd loc))) (kind (grid!!(fst (location x))!!(snd (location x))))) (max_speed x) (head $direction (grid!!(fst loc)!!(snd loc))) ((life x) - 1) (if loc == location x then (time x) + 1 else 1) | x <- cars]
																						--should retain previous if intersection

new_loc :: Car -> Char -> (Int,Int)
new_loc car dirr
	| time car < speed car = location car
	| dirr == 'N' = ( (fst (location car)) + 1, snd (location car) )
	| dirr == 'E' = ( fst (location car) , (snd (location car)) + 1 )
	| dirr == 'W' = ( fst (location car) , (snd (location car)) - 1)
	| dirr == 'S' = ( (fst (location car)) - 1, snd (location car) )
	
direct :: Car -> [[Space]] -> StdGen -> Char
direct car grid rand
	| length dirs  == 1 = head dirs
	|otherwise = dirs!!(fst $ randomR (0, (length dirs)) rand )
	where dirs = direction $ grid!!(fst $ location car)!!(snd $ location car)
	
speedAdjust :: Int -> Int -> Char -> Char -> Int
speedAdjust current max space_new space_old
	|space_new == 'S' && space_old /= 'S' = (max*2)
	|space_new /= 'S' && space_old == 'S' = max
	|otherwise = current
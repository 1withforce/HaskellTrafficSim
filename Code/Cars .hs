module Cars (
Car(..),
create_cars,
move_cars
) where


import Grid
import Random

data Car = Car { location :: (Int,Int), speed :: Int, max_speed :: Int, time :: Int } deriving (Show)
-- lcoation states where the car is (coords are reversed to work better with grid), speed is how fast it is currently going (higher is slower), max_speed is maximum speed, time is how long it has been on current space.

create_cars :: [( (Int,Int) , Int )] -> [Car] --for the initial creation of cars
create_cars locs = [ Car (fst x) (snd x) (snd x) 0 | x <- locs]

move_cars :: [Car] -> [[Space]] -> StdGen -> [Car] --used to move the cars each turn
move_cars carslist grid rand = [ let loc = new_loc x (direct x grid rand) in Car (move loc x grid) (speedAdjust (speed x) (max_speed x) (kind (grid!!(fst (move loc x grid))!!(snd (move loc x grid)))) (kind (grid!!(fst (location x))!!(snd (location x))))) (max_speed x) (if (move loc x grid) == location x then (time x) + 1 else 1) | x <- carslist]

move :: (Int,Int) -> Car -> [[Space]] -> (Int,Int) --checks to see if next space is occupied. Will not move if so.
move loc x grid = if (cars (grid!!(fst loc)!!(snd loc)) == 0) then loc else location x

new_loc :: Car -> Char -> (Int,Int) -- gives new coordinates if car is ready to move
new_loc car dirr
	| time car < speed car = location car
	| dirr == 'N' = ( (fst (location car)) + 1, snd (location car) )
	| dirr == 'E' = ( fst (location car) , (snd (location car)) + 1 )
	| dirr == 'W' = ( fst (location car) , (snd (location car)) - 1)
	| dirr == 'S' = ( (fst (location car)) - 1, snd (location car) )
	| otherwise = error "direction invalid"
	
direct :: Car -> [[Space]] -> StdGen -> Char --picks which direction to go next
direct car grid rand
	| length dirs  == 1 = head dirs
	| otherwise = dirs!!(fst $ randomR ( 0, (length dirs)-1 ) rand )
	where dirs = direction $ grid!!(fst $ location car)!!(snd $ location car)
	
speedAdjust :: Int -> Int -> Char -> Char -> Int --slows down for stop signs
speedAdjust current max space_new space_old
	|space_new == 'S' && space_old /= 'S' = (max*2)
	|space_new /= 'S' && space_old == 'S' = max
	|otherwise = current
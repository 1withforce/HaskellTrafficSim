import Grid
import Cars
import Control.Monad
import Random

--This is a traffic simulator.
main :: IO ()
main = do
	rand <- newStdGen
	let carList = move_cars cars grid rand
		where cars = create_cars [((0,0), 1) , ((1,1), 2)] -- These are location and speed. Number of items in list determines number of cars created.
	let newGrid = update [ location x | x <- carList ] grid
	loop (carList) (newGrid) rand

-- loop keeps the cars constantly moving until there are no cars on the screen.
loop :: [Car] -> [[Space]] -> StdGen -> IO ()
loop carlist grid rand = do
	let coll = concat [[coords x | x <- y, cars x > 1] | y <- grid] --find any collisions
	let carlist2 = [car | car <- carlist, ((location car) `elem` coll) == False]--removes cars that have collided.
	forM (gridPrint grid) (\x -> do --replace with display
		print ( x ))
	print ""
	let carList = move_cars carlist2 grid rand --move cars
	let newGrid = update [ location x | x <- carList ] grid --update grid
	let rand2 = snd $ next rand --new random number generator
	if length carList > 0 then loop (carList) (newGrid) rand2 else print "end" --repeat if cars remain.
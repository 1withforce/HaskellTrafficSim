import Grid
import Cars
import Control.Monad
import Random

main :: IO ()
main = do
	rand <- newStdGen
	let carList = move_cars cars grid rand
		where cars = create_cars [((0,0), 1) , ((1,1), 2)] -- These are location and speed
	let newGrid = update [ location x | x <- carList ] grid
	loop (carList) (grid) rand

loop cars grid rand = do
	forM (gridPrint grid) (\x -> do
		print ( x ))
	print ""
	let carList = move_cars cars grid rand
	let newGrid = update [ location x | x <- carList ] grid
	let rand = snd $ next rand
	loop (carList) (newGrid) rand
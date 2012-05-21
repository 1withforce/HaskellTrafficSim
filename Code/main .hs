import Grid
import Cars
import Control.Monad

main :: IO ()
main = do
	let r = move_cars cars grid
		where cars = create_cars [(0,0), (1,1)]
	loop (fst r) (snd r)

loop cars grid = do
	print [location car | car <- cars]
	let q = move_cars cars grid
	loop (fst q) (snd q)
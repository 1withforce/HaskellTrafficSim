import grid
import cars

main :: IO ()
main = do
	display grid --display must be IO
	main_loop cars grid --type must be IO
		where cars = create_cars [locations] --may want more info

main_loop :: [Cars] -> [[Space]] -> IO
main_loop cars grid = if exit then exit
				else display (snd new_cars)
					 main_loop (fst new_cars) (snd new cars)
				where new_cars = move_cars cars --move_cars must return both cars and grid
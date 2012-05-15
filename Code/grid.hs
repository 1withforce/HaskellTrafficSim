data Space = { coords :: (Int,Int), cars:: Int, kind :: Char, direction :: Char }

grid = [[ Space (0,0) 0 'I' 'E', Space (0,1) 0 'I' 'E', Space (0,2) 0 'S' 'E', Space (0,3) 0 'R' 'E', Space (0,4) 0 'R' 'E', Space (0,5) 0 'I' 'E', Space (0,6) 0 'I' 'N'],
		[ Space (1,0) 0 'I' 'S', Space (1,1) 0 'I' 'N', Space (1,2) 0 'R' 'W', Space (1,3) 0 'R' 'W', Space (1,4) 0 'S' 'W', Space (1,5) 0 'I' 'W', Space (1,6) 0 'I' 'N'],
		[ Space (2,0) 0 'R' 'S', Space (2,1) 0 'S' 'N', Space (2,2) 0 'G' 'G', Space (2,3) 0 'G' 'G', Space (2,4) 0 'G' 'G', Space (2,5) 0 'R' 'S', Space (2,6) 0 'S' 'N'],
		[ Space (3,0) 0 'R' 'S', Space (3,1) 0 'R' 'N', Space (3,2) 0 'G' 'G', Space (3,3) 0 'G' 'G', Space (3,4) 0 'G' 'G', Space (3,5) 0 'R' 'S', Space (3,6) 0 'R' 'N'],
		[ Space (4,0) 0 'R' 'S', Space (4,1) 0 'R' 'N', Space (4,2) 0 'G' 'G', Space (4,3) 0 'G' 'G', Space (4,4) 0 'G' 'G', Space (4,5) 0 'R' 'S', Space (4,6) 0 'R' 'N'],
		[ Space (5,0) 0 'S' 'S', Space (5,1) 0 'R' 'N', Space (5,2) 0 'G' 'G', Space (5,3) 0 'G' 'G', Space (5,4) 0 'G' 'G', Space (5,5) 0 'S' 'S', Space (5,6) 0 'R' 'N'],
		[ Space (6,0) 0 'I' 'S', Space (6,1) 0 'I' 'E', Space (6,2) 0 'S' 'E', Space (6,3) 0 'R' 'E', Space (6,4) 0 'R' 'E', Space (6,5) 0 'I' 'S', Space (6,6) 0 'I' 'N'],
		[ Space (7,0) 0 'I' 'S', Space (7,1) 0 'I' 'W', Space (7,2) 0 'R' 'W', Space (7,3) 0 'R' 'W', Space (7,4) 0 'S' 'W', Space (7,5) 0 'I' 'W', Space (7,6) 0 'I' 'W']]
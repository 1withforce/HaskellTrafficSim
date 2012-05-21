module Grid(
Space(..),
grid,
update,
gridPrint
) where

import Data.List

data Space = Space { coords :: (Int,Int), cars:: Int, kind :: Char, direction :: [Char] }
--coords are the coordinates (y,x not x,y), cars states the number of cars on the space, kind is the type of space ( r = regular road, s = stop sign, i = intersection, g = grass), direction is a list of possible movements from that space.

update :: [(Int,Int)] -> [[Space]] -> [[Space]] -- updates cars in grid 
update cars grid = [[ Space (coords y) (length $ (coords y) `elemIndices` cars) (kind y) (direction y) | y <- x] | x <- grid]

gridPrint :: [[Space]] -> [[Char]] -- will be removed when we have a regular display
gridPrint grid = order ([ unwords [ if cars y > 0 then (if cars y == 1 then "x" else "C") else (if kind y == 'G' then "G" else "/")| y <- x] | x <- grid]) []

order :: [[Char]] -> [[Char]] -> [[Char]] --will be removed when we have a regular display
order [] new = new
order (x:xs) new = order xs (x:new)

--This is the grid being used. 14x14 box with two lines cutting through the middle and creating a four-way intersection in the center. Can be replaced with a new one for a different design.
grid = [[ Space (0,0) 0 'I' ['E'], Space (0,1) 0 'I' ['E'], Space (0,2) 0 'R' ['E'], Space (0,3) 0 'R' ['E'], Space (0,4) 0 'R' ['E'], Space (0,5) 0 'S' ['E'], Space (0,6) 0 'I' ['E'], Space (0,7) 0 'I' ['N','E'], Space (0,8) 0 'R' ['E'], Space (0,9) 0 'R' ['E'], Space (0,10) 0 'R' ['E'], Space (0,11) 0 'S' ['E'], Space (0,12) 0 'I' ['E'], Space (0,13) 0 'I' ['N']],
		[ Space (1,0) 0 'I' ['S'], Space (1,1) 0 'I' ['N'], Space (1,2) 0 'S' ['W'], Space (1,3) 0 'R' ['W'], Space (1,4) 0 'R' ['W'], Space (1,5) 0 'R' ['W'], Space (1,6) 0 'I' ['S', 'W'], Space (1,7) 0 'I' ['N','W'], Space (1,8) 0 'S' ['W'], Space (1,9) 0 'R' ['W'], Space (1,10) 0 'R' ['W'], Space (1,11) 0 'R' ['W'], Space (1,12) 0 'I' ['W'], Space (1,13) 0 'I' ['N']],
		[ Space (2,0) 0 'S' ['S'], Space (2,1) 0 'R' ['N'], Space (2,2) 0 'G' ['G'], Space (2,3) 0 'G' ['G'], Space (2,4) 0 'G' ['G'], Space (2,5) 0 'G' ['G'], Space (2,6) 0 'S' ['S'], Space (2,7) 0 'R' ['N'], Space (2,8) 0 'G' ['G'], Space (2,9) 0 'G' ['G'], Space (2,10) 0 'G' ['G'], Space (2,11) 0 'G' ['G'], Space (2,12) 0 'S' ['S'], Space (2,13) 0 'R' ['N']],
		[ Space (3,0) 0 'R' ['S'], Space (3,1) 0 'R' ['N'], Space (3,2) 0 'G' ['G'], Space (3,3) 0 'G' ['G'], Space (3,4) 0 'G' ['G'], Space (3,5) 0 'G' ['G'], Space (3,6) 0 'R' ['S'], Space (3,7) 0 'R' ['N'], Space (3,8) 0 'G' ['G'], Space (3,9) 0 'G' ['G'], Space (3,10) 0 'G' ['G'], Space (3,11) 0 'G' ['G'], Space (3,12) 0 'R' ['S'], Space (3,13) 0 'R' ['N']],
		[ Space (4,0) 0 'R' ['S'], Space (4,1) 0 'R' ['N'], Space (4,2) 0 'G' ['G'], Space (4,3) 0 'G' ['G'], Space (4,4) 0 'G' ['G'], Space (4,5) 0 'G' ['G'], Space (4,6) 0 'R' ['S'], Space (4,7) 0 'R' ['N'], Space (4,8) 0 'G' ['G'], Space (4,9) 0 'G' ['G'], Space (4,10) 0 'G' ['G'], Space (4,11) 0 'G' ['G'], Space (4,12) 0 'R' ['S'], Space (4,13) 0 'R' ['N']],
		[ Space (5,0) 0 'R' ['S'], Space (5,1) 0 'S' ['N'], Space (5,2) 0 'G' ['G'], Space (5,3) 0 'G' ['G'], Space (5,4) 0 'G' ['G'], Space (5,5) 0 'G' ['G'], Space (5,6) 0 'R' ['S'], Space (5,7) 0 'S' ['N'], Space (5,8) 0 'G' ['G'], Space (5,9) 0 'G' ['G'], Space (5,10) 0 'G' ['G'], Space (5,11) 0 'G' ['G'], Space (5,12) 0 'R' ['S'], Space (5,13) 0 'S' ['N']],
		[ Space (6,0) 0 'I' ['S', 'E'], Space (6,1) 0 'I' ['N','E'], Space (6,2) 0 'R' ['E'], Space (6,3) 0 'R' ['E'], Space (6,4) 0 'R' ['E'], Space (6,5) 0 'S' ['E'], Space (6,6) 0 'I' ['E','S'], Space (6,7) 0 'I' ['N','E'], Space (6,8) 0 'R' ['E'], Space (6,9) 0 'R' ['E'], Space (6,10) 0 'R' ['E'], Space (6,11) 0 'S' ['E'], Space (6,12) 0 'I' ['E','S'], Space (6,13) 0 'I' ['N']],
		[ Space (7,0) 0 'I' ['S'], Space (7,1) 0 'I' ['N','W'], Space (7,2) 0 'S' ['W'], Space (7,3) 0 'R' ['W'], Space (7,4) 0 'R' ['W'], Space (7,5) 0 'R' ['W'], Space (7,6) 0 'I' ['W','S'], Space (7,7) 0 'I' ['N','W'], Space (7,8) 0 'S' ['W'], Space (7,9) 0 'R' ['W'], Space (7,10) 0 'R' ['W'], Space (7,11) 0 'R' ['W'], Space (7,12) 0 'I' ['S','W'], Space (7,13) 0 'I' ['N','W']],
		[ Space (8,0) 0 'S' ['S'], Space (8,1) 0 'R' ['N'], Space (8,2) 0 'G' ['G'], Space (8,3) 0 'G' ['G'], Space (8,4) 0 'G' ['G'], Space (8,5) 0 'G' ['G'], Space (8,6) 0 'S' ['S'], Space (8,7) 0 'R' ['N'], Space (8,8) 0 'G' ['G'], Space (8,9) 0 'G' ['G'], Space (8,10) 0 'G' ['G'], Space (8,11) 0 'G' ['G'], Space (8,12) 0 'S' ['S'], Space (8,13) 0 'R' ['N']],
		[ Space (9,0) 0 'R' ['S'], Space (9,1) 0 'R' ['N'], Space (9,2) 0 'G' ['G'], Space (9,3) 0 'G' ['G'], Space (9,4) 0 'G' ['G'], Space (9,5) 0 'G' ['G'], Space (9,6) 0 'R' ['S'], Space (9,7) 0 'R' ['N'], Space (9,8) 0 'G' ['G'], Space (9,9) 0 'G' ['G'], Space (9,10) 0 'G' ['G'], Space (9,11) 0 'G' ['G'], Space (9,12) 0 'R' ['S'], Space (9,13) 0 'R' ['N']],
		[ Space (10,0) 0 'R' ['S'], Space (10,1) 0 'R' ['N'], Space (10,2) 0 'G' ['G'], Space (10,3) 0 'G' ['G'], Space (10,4) 0 'G' ['G'], Space (10,5) 0 'G' ['G'], Space (10,6) 0 'R' ['S'], Space (10,7) 0 'R' ['N'], Space (10,8) 0 'G' ['G'], Space (10,9) 0 'G' ['G'], Space (10,10) 0 'G' ['G'], Space (10,11) 0 'G' ['G'], Space (10,12) 0 'R' ['S'], Space (10,13) 0 'R' ['N']],
		[ Space (11,0) 0 'R' ['S'], Space (11,1) 0 'S' ['N'], Space (11,2) 0 'G' ['G'], Space (11,3) 0 'G' ['G'], Space (11,4) 0 'G' ['G'], Space (11,5) 0 'G' ['G'], Space (11,6) 0 'R' ['S'], Space (11,7) 0 'S' ['N'], Space (11,8) 0 'G' ['G'], Space (11,9) 0 'G' ['G'], Space (11,10) 0 'G' ['G'], Space (11,11) 0 'G' ['G'], Space (11,12) 0 'R' ['S'], Space (11,13) 0 'S' ['N']],
		[ Space (12,0) 0 'I' ['S'], Space (12,1) 0 'I' ['E'], Space (12,2) 0 'R' ['E'], Space (12,3) 0 'R' ['E'], Space (12,4) 0 'R' ['E'], Space (12,5) 0 'S' ['E'], Space (12,6) 0 'I' ['E','S'], Space (12,7) 0 'I' ['N','E'], Space (12,8) 0 'R' ['E'], Space (12,9) 0 'R' ['E'], Space (12,10) 0 'R' ['E'], Space (12,11) 0 'S' ['E'], Space (12,12) 0 'I' ['S'], Space (12,13) 0 'I' ['N']],
		[ Space (13,0) 0 'I' ['S'], Space (13,1) 0 'I' ['W'], Space (13,2) 0 'S' ['W'], Space (13,3) 0 'R' ['W'], Space (13,4) 0 'R' ['W'], Space (13,5) 0 'R' ['W'], Space (13,6) 0 'I' ['W','S'], Space (13,7) 0 'I' ['W'], Space (13,8) 0 'S' ['W'], Space (13,9) 0 'R' ['W'], Space (13,10) 0 'R' ['W'], Space (13,11) 0 'R' ['W'], Space (13,12) 0 'I' ['W'], Space (13,13) 0 'I' ['W']]]
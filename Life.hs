module Life where

import Data.Maybe (catMaybes)

data State = Dead | Alive deriving (Eq, Show)
newtype Grid = Grid [[State]] deriving (Eq, Show)

-- Any live cell with fewer than two live neighbors dies.
-- Any live cell with two or three live neighbors lives.
-- Any live cell with more than three live neighbors dies.
-- Any dead cell with exactly three neighbors becomes live.

generation :: (State, Int) -> State
generation (Alive, 2) = Alive
generation (_    , 3) = Alive
generation (_    , _) = Dead

-- I know this can be done more cleanly...
neighbors :: Int -> [State] -> [State] -> [State] -> [State]
neighbors x rowAbove rowOfX rowBelow =
  let (w,y) = (x-1,x+1)
      cs = [w, x, y, w, y, w, x, y]
      -- Which rs is better?
      --rs = [rowAbove, rowAbove, rowAbove, rowOfX, rowOfX, rowBelow, rowBelow, rowBelow]
      rs = replicate 3 rowAbove ++ replicate 2 rowOfX ++ replicate 3 rowBelow
   in catMaybes . map maybeCell $ zip rs cs
  where maybeCell (r,c)
          | c < 0        = Nothing
          | c >= length r = Nothing
          | otherwise    = Just (r!!c)

gridGeneration :: Grid -> Grid
gridGeneration (Grid []) = Grid []
gridGeneration (Grid rs@(row0:row1:row2:rows)) = Grid $ g ([]:rs)
  where
    g (r0:r1:r2:rs) = [processRow r0 r1 r2] ++ g (r1:r2:rs)
    g (r0:r1:[])    = [processRow r0 r1 []]
    g  _            = []
    processRow r0 r1 r2 = reverse $ foldl p [] [0..(length r1 - 1)]
      where p a n = (generation (r1!!n, live $ neighbors n r0 r1 r2)) : a
            live = length . filter (==Alive)
gridGeneration _ = undefined

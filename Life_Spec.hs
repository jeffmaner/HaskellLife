module Life_Spec where

import Test.Hspec
import Life

-- Any live cell with fewer than two live neighbors dies.
-- Any live cell with two or three live neighbors lives.
-- Any live cell with more than three live neighbors dies.
-- Any dead cell with exactly three live neighbors becomes live.

main :: IO ()
main = hspec $ do
  describe "Life" $ do
    it "Returns a dead cell for a live cell with fewer than two live neighbors." $
      generation (Alive, 1) `shouldBe` Dead

    it "Returns a live cell for a live cell with two or three live neighbors." $
      generation (Alive, 2) `shouldBe` Alive

    it "Returns a live cell for a live cell with two or three live neighbors." $
      generation (Alive, 3) `shouldBe` Alive

    it "Returns a dead cell for a live cell with more than three live neighbors." $
      generation (Alive, 4) `shouldBe` Dead

    it "Returns a live cell for a dead cell with more exactly three live neighbors." $
      generation (Dead, 3) `shouldBe` Alive


    it "Returns the indices of a cell's neighbors for a 3x3 grid." $
      neighbors 0 [] [Dead, Alive, Dead] [Dead, Alive, Dead] `shouldBe` [Alive, Dead, Alive]

    it "Returns an empty Grid when given an empty Grid." $
      gridGeneration (Grid []) `shouldBe` (Grid [])

    it "Successfully processes the 3x3 blinker grid." $
      gridGeneration (Grid [[Dead, Alive, Dead],
                            [Dead, Alive, Dead],
                            [Dead, Alive, Dead]]) `shouldBe` (Grid [[Dead , Dead , Dead ],
                                                                    [Alive, Alive, Alive],
                                                                    [Dead , Dead , Dead ]])

    it "Successfully processes the 5x5 blinker grid." $
      gridGeneration (Grid [[Dead, Dead, Dead , Dead, Dead],
                            [Dead, Dead, Alive, Dead, Dead],
                            [Dead, Dead, Alive, Dead, Dead],
                            [Dead, Dead, Alive, Dead, Dead],
                            [Dead, Dead, Dead , Dead, Dead]]) `shouldBe` (Grid [[Dead, Dead , Dead , Dead , Dead],
                                                                                [Dead, Dead , Dead , Dead , Dead],
                                                                                [Dead, Alive, Alive, Alive, Dead],
                                                                                [Dead, Dead , Dead , Dead , Dead],
                                                                                [Dead, Dead , Dead , Dead , Dead]])

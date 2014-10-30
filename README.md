Life
====

This is [Conway's Game of Life][1] implemented in [Haskell][2] using
[Test-Driven Development][3]. This is a very naive implementation, which is all
I was after. For speed and space constraints, arrays could be used instead of
lists, and the algorithms could be smarter.

Also, I'm fairly confident there's an algorithm out there to find neighboring
cells. But I couldn't find it. Again, a simple, naive implementation.

I may eventually build a GUI front-end for this for visualization; but for now
one must use one's imagination. :)

To run this code, download and install the [Haskell Platform][4]. Then from an
admin console, run

`cabal update`

and

`cabal install hspec`

Now one should be able to

`runhaskell Life_Spec.hs`

and see all the tests pass.

[1]: http://en.wikipedia.org/wiki/Conway's_Game_of_Life
[2]: https://www.haskell.org/haskellwiki/Haskell
[3]: http://en.wikipedia.org/wiki/Test-driven_development
[4]: https://www.haskell.org/platform/

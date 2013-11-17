{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE UndecidableInstances   #-}

import Prelude hiding (odd, even)

-- Code beyond this point is mostly from Thomas Hallgren's paper on implementing
-- even/odd computations by using Haskell's type checker:
-- http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.7806

-- See the README.md for usage examples.

data Zero
data Succ n

-- A couple of sample Peano numbers.
type Three = Succ (Succ (Succ Zero))
type Four  = Succ (Succ (Succ (Succ Zero)))

data True
data False

instance Even Zero True
instance Odd Zero False

class Even n b | n -> b where even :: n -> b
class Odd  n b | n -> b where odd  :: n -> b

instance Odd  n b => Even (Succ n) b
instance Even n b => Odd  (Succ n) b

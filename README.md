# Verification of an odd or even Peano number in Haskell using typeclasses

It doesn't seem entirely straight-forward to have Haskell's type system enforce
constraints such as a number being even. One option seems to be
LiquidHaskell. Some posts I read on Stack Overflow encourage using a [smart
constructor](http://haskell.org/haskellwiki/Smart_constructors) to make sure
that your constraint is enforced, but then the work isn't done by the type
system.

There is an interesting [article by Thomas
Hallgren](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.7806) that
leads towards having Haskell's type system express computations such as if a
number is even or odd. This uses Haskell's [functional dependencies
extension](http://www.haskell.org/haskellwiki/Functional_dependencies). I copied
some of his code in [EvenType.hs](EvenType.hs) and adapted it to work with a new
GHC, basically by adding several language extensions. With this program you can
ask Haskell's type system if certain [Peano
numbers](http://www.haskell.org/haskellwiki/Peano_numbers) are even or odd.

Beyond using functional dependencies, it seems that [type families are another
way of 'faking' dependent types in Haskell](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.2636) which seems promising.

## Usage

    λ: :l EvenType.hs
    λ: :t odd (undefined::Three)
    odd (undefined::Three) :: True
    λ: :t even (undefined::Three)
    even (undefined::Three) :: False
    λ: :t even (undefined::Four)
    even (undefined::Four) :: True

# APL ∊ BCN - Meet #4 - 2022-09-17
## Historical APL paper reading group

## Contents

1. Structure & goal of the historical APL paper reading meetings
2. The paper
   1. Introduction (meet #4)
   2. Important Characteristics of Notation (meet #4)
   3. Polynomials (meet #5)
   4. Representations (meet #6)
   5. Identities and Proofs (meet #6, meet #7)
   6. Conclusion (meet #7) 
3. Discussion & questions

# Structure & goal of the historical APL paper reading meetings

### Structure

- Beforehand you'll be given the paper of the forthcoming meeting so you can have a fast look.
- Many papers will be taken from the [JSoftware](https://www.jsoftware.com/papers/) website where they have a nice collection of important and historical APL/J papers.

### Goal
- Get a deeper understanding of the founding languages of the array programming paradigm (APL, J).
- As a consequence of the previous goal, become better APLjk programmers.

## The paper

### Notation as a Tool of Thought
#### Kenneth E. Iverson, IBM Thomas J. Watson Research Center

Excerpts taken from the original paper at [Jsoftware site](https://www.jsoftware.com/papers/tot.htm) or [ACM site](https://dl.acm.org/doi/pdf/10.1145/358896.358899).

### i) Introduction

> (a)	 	Section ii) identifies salient characteristics of mathematical notation and uses simple problems to illustrate how these characteristics may be provided in an executable notation.

> (b)	 	Sections iii) and iv) continue this illustration by deeper treatment of a set of topics chosen for their general interest and utility. Section iii) concerns polynomials, and Section iv) concerns transformations between representations of functions relevant to a number of topics, including permutations and directed graphs. Although these topics might be characterized as mathematical, they are directly relevant to computer programming, and their relevance will increase as programming continues to develop into a legitimate mathematical discipline.

> (c)	 	Section v) provides examples of identities and formal proofs. Many of these formal proofs concern identities established informally and used in preceeding sections.

> (d)	 	The concluding section vi) provides some general comparisons with mathematical notation, references to treatments of other topics, and discussion of the problem of introducing notation in context.

### ii) Important Characteristics of Notation

We'll use examples from Dyalog APL in comparison with NumPy, and see how the same thing is done in both languages.

As we'll see APL makes things easier when it comes to array calculations, and this is why we call APL an array language, or a language were arrays of any dimension are first class citizens.

#### a) Ease of Expressing Constructs Arising in Problems

Sum Reduction:

```apl
     ⍳5
1 2 3 4 5
      +/⍳5
15
```

Partial sums or sum scan:

```apl
      +\⍳5 ⍝ producing the first 5 triangular numbers
1 3 6 10 15
      +/+\⍳5 ⍝ the sum of the first 5 triangulars
35
     +\+\⍳5 ⍝ producing the first 5 tetrahedral numbers
1 4 10 20 35
```

Geometric interpretation:
- triangular numbers
- tetrahedral
- [tetrahedral numbers](https://mathworld.wolfram.com/TetrahedralNumber.html), a generalization of triangular numbers in three dimensions
- "The final expression gives the total number of atoms in the tetrahedron.". The author means that if one sums the "atoms" of a tetrahedron with five levels, they'll get the number 35.

```apl
      ⍳6
1 2 3 4 5 6
      ⍳5
1 2 3 4 5
      ⌽⍳5  ⍝ reverse elements of array
5 4 3 2 1
      (⍳5)+(⌽⍳5)
6 6 6 6 6
```

Multiplication `×` as repetitive addition:

```apl
      5⍴6
6 6 6 6 6
      +/5⍴6 
30
      6×5
30
```

First equivalence:

- A sum reduction of the first `n` integers is equivalent to the discrete "area" of a right triangle with `n` elements on the one side and `n+1` to the other, i.e. `(n+1)×n)÷2`.
- In APL, where `←→` denotes the equivalence: `+/⍳n ←→ ((n+1)×n)÷2`  **A.1**.


#### b) Suggestivity

> A notation will be said to be *suggestive* if the forms of the expressions arising in one set of problems suggest related expressions which find application in other problems.

We'll introduce the following operators (also called in the array languages terminology, "verbs", because they're being applied onto "nouns").

```apl
   ⍳   ⌽   ⍴   +/   +\
```

Two equivalences with *reduction*:

```apl
  +/m⍴n ←→ n×m ⍝ sum reduction and multiplication operation
  ×/m⍴n ←→ n*m ⍝ product reduction power operation
```

Two equivalences with *scan*:

```apl
  +\m⍴n ←→ n×⍳m  ⍝ partial sums and multiplication operation
  ×\m⍴n ←→ n*⍳m  ⍝ partial products and power operation
```

Factorial:

```apl
      ⍳5
1 2 3 4 5
      ×/⍳5                      ×\⍳5
120                       1 2 6 24 120
      !5                        !⍳5
120                       1 2 6 24 120
```

> Part of the suggestive power of a language resides in the ability to represent identities in brief, general, and easily remembered forms. 

Product reduction and logarithms:

> If v is a vector of positive numbers, then the product ×/v may be obtained by taking the natural logarithms of each element of v (denoted by ⍟v), summing them (+/⍟v), and applying the exponential function (*+/⍟v). 

In simpler words, the product of n positive numbers equals to the exponential of the sum of the logarithms of each number.

In pseudo-APL:

```apl
   ×/v ←→ *+/⍟v ⍝ Equivalence   
```

Example:

```apl
    +\⍳5
1 3 6 10 15
    v ← +\⍳5
    ×/v
2700
    *+/⍟v
2700
```

> Since the exponential function * is the inverse of the natural logarithm ⍟ , the general form suggested by the right side of the identity is:

inverse_g f/g v

inverse_g: is the inverse of the operation g


De Morgan Laws:

```apl
∧/b ←→ ~∨/~b ⍝ AND/b ←→ NOT(OR/NOT(b))
∨/b ←→ ~^/~b ⍝  OR/b ←→ NOT(AND/NOT(b))
```

Example:

```apl
      b ← 1 0 0 0 1 1
      ∧/b
0
      ~∨/~b
0
      ∨/b
1
      ~∧/~b
1
```

Unique:

```apl
      ≠/b ←→ ~=/~b ⍝ not_eq/b ←→ NOT(eq/NOT(b))
      =/b ←→ ~≠/~b ⍝     eq/b ←→ NOT(not_eq/NOT(b))
```

Example:

```apl
      b
1 0 0 0 1 1
      ~b
0 1 1 1 0 0
      ≠/b
1
      ~=/~b
1
      =/b
0
      ~≠/~b
0
```

> Finally, using ⌈ and ⌊ to denote the maximum and minimum functions, we can express dualities which involve arithmetic negation:

In pseudo-APL:

```apl
      ⌈/v ←→ -⌊/-v
      ⌊/v ←→ -⌈/-v
```

Example:

(live)

> It may also be noted that scan (`f\`) may replace reduction (`f/`) in any of the foregoing dualities.

#### c) Subordination of Detail

[Subordinate](https://www.google.com/search?q=subordinate):

> verb
> /səˈbɔːdɪneɪt/
> treat or regard as of lesser importance than something else.
> "practical considerations were subordinated to political expediency"

In modern words, abstraction or modeling. Leaving the details out and focusing on the important things.

> we will here consider three important ways of doing this: 
> - the use of arrays, 
> - the assignment of names to functions and variables, 
> - and the use of operators.

[Leading Axis theory](https://aplwiki.com/wiki/Leading_axis_theory)

> In particular, one may specify the axis to which a function applies. For example, ⌽[1]m acts along the first axis of a matrix m to reverse each of the columns, and ⌽[2]m reverses each row; 

> m,[1]n catenates columns (placing m above n), and m,[2]n catenates rows; and +/[1]m sums columns and +/[2]m sums rows. If no axis is specified, the function applies along the last axis. Thus +/m sums rows.

> Finally, reduction and scan along the first axis may be denoted by the symbols ⌿ and ⍀.

**Variables, primitive functions, custom functions**

```apl

⍝ Variables
      crate ← 144 
      layer ← crate÷8 
      row ← layer÷3

⍝ Catenation
      (⍳5),(⌽⍳5)
1 2 3 4 5 5 4 3 2 1

⍝ Changing base in number system

      2 2 2 ⊤ 3
0 1 1 
      2 2 2 ⊤ 4
1 0 0

⍝ Binary matrix

bn ← 2 2 2 ⊤ 0 1 2 3 4 5 6 7
      bn
0 0 0 0 1 1 1 1
0 0 1 1 0 0 1 1
0 1 0 1 0 1 0 1

      bn, ⌽bn
0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0
0 0 1 1 0 0 1 1 1 1 0 0 1 1 0 0
0 1 0 1 0 1 0 1 1 0 1 0 1 0 1 0

⍝ Fuction definition

      T ← {(⍵⍴2)⊤(⍳2*⍵)-1}

      bc ← {k ← ⍺
            n ← ⍵
            k!n ⍝ n choose k
      }

      3 bc 5
10
      3!5
10
```

**Operators**

> The term operator, used in the strict sense defined in mathematics rather than loosely as a synonym for function, refers to an entity which applies to functions to produce functions; an example is the derivative operator.

> We have already met two operators, reduction, and scan, denoted by / and \ , and seen how they contribute to brevity by applying to different functions to produce families of related functions such as +/ and ×/ and ^/ .

> A function (such as +/) produced by an operator will be called a derived function.

In J terminology:
- arrays are nouns
- functions are verbs that act on nouns
- operators are adverbs since they act on verbs

*Inner product*

> If p and q are two vectors, then the inner product +.× is defined by:

```apl
      p +.× q ←→ +/p×q
```

Example:

```apl
     p←2 3 5
      q←2 1 2
      p+.×q
17
      p×.*q
300
      p⌊.+q
4
```

> The phrase `∘.×` is a special use of the inner product operator to produce a derived function which yields products of each element of its left argument with each element of its right. For example:

```apl
      2 3 5∘.×⍳5
2  4  6  8 10
3  6  9 12 15
5 10 15 20 25
```

*Outer product*

> The function ∘.× is called outer product, as it is in tensor analysis, and functions such as ∘.+ and ∘.* and ∘.< are defined analogously, producing “function tables” for the particular functions.

Examples:

```apl
      d←0 1 2 3
      d∘.⌈d                     d∘.≥d                   d∘.!d 
0 1 2 3                   1 0 0 0                 1 1 1 1 
1 1 2 3                   1 1 0 0                 0 1 2 3 
2 2 2 3                   1 1 1 0                 0 0 1 3 
3 3 3 3                   1 1 1 1                 0 0 0 1 
```

*Testing assosiativity*

```apl
   d←0 1

d∘.∧(d∘.∧d)    (d∘.∧d)∘.∧d    d∘.≤(d∘.≤d)    (d∘.≤d)∘.≤d 
   0 0            0 0            1 1             0 1 
   0 0            0 0            1 1             0 1 
                    
   0 0            0 0            1 1             1 1 
   0 1            0 1            0 1             0 1 
```

#### d) Economy

> Economy requires that a large number of ideas be expressible in terms of a relatively small vocabulary. A fundamental scheme for achieving this is the introduction of grammatical rules by which meaningful phrases and sentences can be constructed by combining elements of the vocabulary.

Vocabulary so far:

```apl
     ⍳   ⍴   ⌽   ⊤   , 
      /   \   .  

      + - × ÷ * ⍟ ! ⌈ ⌊ ⍉ 
      ∨ ∧ ~ < ≤ = ≥ > ≠
```

> The five functions and three operators listed in the first two rows are of primary interest, the remaining familiar functions having been introduced to illustrate the versatility of the operators.

Monadic and dyadic functions:
- x*y, *y (power, exp)
- x⍟y and ⍟y (base x log, natural log)
- x÷y and ÷y (division, reciprocal)
- x!y and !y (binomial coeff, factorial)
- rho (replicate, shape)
- ⌽ (reverse, rotate)
- comma (catenation, ravel)


#### e) Amenability to Formal Proofs

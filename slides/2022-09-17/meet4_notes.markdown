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



#### d) Economy

#### e) Amenability to Formal Proofs

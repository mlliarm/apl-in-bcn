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
      +\⍳5
1 3 6 10 15
      +/+\⍳5
35
```

Geometric interpretation:
- tetrahedral
- tetrahedral numbers, a generalization of triangular dimensions to three dimensions
- "The final expression gives the total number of atoms in the tetrahedron."

```apl
      ⍳6
1 2 3 4 5 6
      ⍳5
1 2 3 4 5
      ⌽⍳5
5 4 3 2 1
      (⍳5)+(⌽⍳5)
6 6 6 6 6
```

```apl
      5⍴6
6 6 6 6 6
      +/5⍴6
30
      6×5
30
```

#### b) Suggestivity

We'll introduce the following operators (also called in the array languages terminology, "verbs", because they're being applied onto "nouns").

```apl
   ⍳   ⌽   ⍴   +/   +\
```

#### c) Subordination of Detail



#### d) Economy

#### e) Amenability to Formal Proofs

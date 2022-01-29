NB. Code from the presentation of the 2nd meet of the group APL \in BCN.

NB. 01. Basic calculations with J
1 2 3 + 4 5 6

*/1+ i.10

!10

2 2 4 $ 1 2 11 22
NB. 1 2 11 22
NB. 1 2 11 22
NB.
NB. 1 2 11 22
NB. 1 2 11 22

1 2 3 # 1 2 3
NB. 1 2 2 3 3 3

, 2 2$99
NB. 99 99 99 99

, 2 3$99
NB. 99 99 99 99 99 99

, 2 4$99
NB. 99 99 99 99 99 99 99 99

, 1 4$99
NB. 99 99 99 99

, 3 4$99
NB. 99 99 99 99 99 99 99 99 99 99 99 99

, 3 3$99
NB. 99 99 99 99 99 99 99 99 99

, 2 3$99
NB. 99 99 99 99 99 99

, 2 4$99
NB. 99 99 99 99 99 99 99 99

, 2 10$99
NB. 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99

, 2 3$99
NB. 99 99 99 99 99 99

, 3 3$99
NB. 99 99 99 99 99 99 99 99 99

23 ; 'APL ∊ BCN meetup'
NB. ┌──┬────────────────┐
NB. │23│APL ∊ BCN meetup│
NB. └──┴────────────────┘

3 {. 'foot'
NB. foo

2 }. 1 2 3 4
NB. 3 4

1 {. 'foot'
NB. f

2 {. 'foot'
NB. fo

{: 'foot'
NB. t


1 }. 1 2 3 4
NB. 2 3 4

2 }. 1 2 3 4
NB. 3 4

3 }. 1 2 3 4
NB. 4

-3 }. 1 2 3 4
NB. _4

3 30 * 2
NB. 6 60

*2
NB. 1

*_2
NB. _1

1j2

|1j2

|1j1

%:2

{.@+. 1j2

{:@+. 1j2

2 3 5 % 3 4 6
NB. 0.666667 0.75 0.833333

(2%3) ; (3%4) ; (5%6)
NB. ┌────────┬────┬────────┐
NB. │0.666667│0.75│0.833333│
NB. └────────┴────┴────────┘
2 3 5 % 3 4 6
NB. 0.666667 0.75 0.833333

2 ^ i.17
NB. 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536

2 10 ^. 8 10000
NB. 2 2

2 3 4 5 6 7 8 9 10 ^. 8 127 32 125 36 49 64 81 10000
NB. 3 4.40937 2.5 3 2 2 2 2 4

2 3 4 5 6 7 8 9 10 ^. 8 27 32 125 36 49 64 81 10000
NB. 3 3 2.5 3 2 2 2 2 4

2 3 4 <. 99 1 2
NB. 2 1 2

<. 3.14
NB. 3

>. 3.14
NB. 4

>. 1.1 0.5 1.9
NB. 2 1 2

2 0.1 1 >. 1.1 0.5 1.9
NB. 2 0.5 1.9

NB. 02. Basic plotting and visualizations with J

load'viewmat'

NB. Sierpinski  fractal
Y=: 3&#. ^:_1 i.243 NB. 243 = 3^5
(255 255 0,0 0 255,:192 128 0) viewmat Y +./ . *. |: Y

NB. Dissect
load'debug/dissect'

;: 'Y=: 3&#. ^:_1 i.243'
NB. ┌─┬──┬─┬─┬──┬──┬──┬──┬───┐
NB. │Y│=:│3│&│#.│^:│_1│i.│243│
NB. └─┴──┴─┴─┴──┴──┴──┴──┴───┘

dissect 'Y=: 3&#. ^:_1 i.243'

;: '(255 255 0,0 0 255,:192 128 0) viewmat Y +./ . *. |: Y'
NB. ┌─┬─────────┬─┬───────┬──┬─────────┬─┬───────┬─┬──┬─┬─┬──┬──┬─┐
NB. │(│255 255 0│,│0 0 255│,:│192 128 0│)│viewmat│Y│+.│/│.│*.│|:│Y│
NB. └─┴─────────┴─┴───────┴──┴─────────┴─┴───────┴─┴──┴─┴─┴──┴──┴─┘

(1 2 3, 4 5 6,: 7 8 9)
NB. 1 2 3
NB. 4 5 6
NB. 7 8 9
(1 2 3, 4 5 6, 7 8 9)
NB. 1 2 3 4 5 6 7 8 9
(1 2 3, 4 5 6)
NB. 1 2 3 4 5 6
(1 2 3,: 4 5 6)
NB. 1 2 3
NB. 4 5 6
(1 2 3,: 4 5 6,: 7 8 9)
NB. 1 2 3
NB. 0 0 0
NB.
NB. 4 5 6
NB. 7 8 9
dissect '(255 255 0,0 0 255,:192 128 0) viewmat Y +./ . *. |: Y'

NB. More general verb of Sierpenski fractal:

Y3 =: {{ 3&#. ^:_1 i.y }}
plot_sierp =: {{ (255 255 0,0 0 255,:192 128 0) viewmat y +./ . *. |: y }}

plot_sierp Y3 1000

plot_sierp Y3 1500

plot_sierp Y3 729 NB. 729 = 3^6

3^/i.10
NB. 1 3 9 27 81 243 729 2187 6561 19683

plot_sierp Y3 2187 NB. 3^7

plot_sierp Y3 6561 NB. 3^8 NB. Out of memory ! (More than 4GB RAM).

NB. dissect 'plot_sierp Y3 6561' NB. Out of memory !

Y5 =: {{ 5&#. ^:_1 i.y }}
5^/i.10
NB. 1 5 25 125 625 3125 15625 78125 390625 1.95312e6

plot_sierp Y5 625

plot_sierp Y5 3125

Y_gen =: {{ x&#. ^:_1 i.y }}

(2 3 4 5 6 7 8 9)^/ 1+i.10
NB. 2  4   8   16    32     64       128       256       512      1024
NB. 3  9  27   81   243    729      2187      6561     19683     59049
NB. 4 16  64  256  1024   4096     16384     65536    262144 1.04858e6
NB. 5 25 125  625  3125  15625     78125    390625 1.95312e6 9.76562e6
NB. 6 36 216 1296  7776  46656    279936 1.67962e6 1.00777e7 6.04662e7
NB. 7 49 343 2401 16807 117649    823543  5.7648e6 4.03536e7 2.82475e8
NB. 8 64 512 4096 32768 262144 2.09715e6 1.67772e7 1.34218e8 1.07374e9
NB. 9 81 729 6561 59049 531441 4.78297e6 4.30467e7  3.8742e8 3.48678e9

plot_sierp 2 Y_gen 1024 NB. Another known fractal
plot_sierp 3 Y_gen 729
plot_sierp 4 Y_gen 1024
plot_sierp 5 Y_gen 625
plot_sierp 6 Y_gen 1296
plot_sierp 7 Y_gen 2401
plot_sierp 8 Y_gen 512
plot_sierp 9 Y_gen 719


NB. A simple plot
load'plot'
'key sin(exp),cos(exp)' plot (;(sin,:cos)@:^) -: >: i:10j100

;: 'plot (;(sin,:cos)@:^) -: >: i:3j100'
NB. ┌────┬─┬─┬─┬───┬──┬───┬─┬──┬─┬─┬──┬──┬──┬─────┐
NB. │plot│(│;│(│sin│,:│cos│)│@:│^│)│-:│>:│i:│3j100│
NB. └────┴─┴─┴─┴───┴──┴───┴─┴──┴─┴─┴──┴──┴──┴─────┘

i:3j10
NB. _3 _2.4 _1.8 _1.2 _0.6 0 0.6 1.2 1.8 2.4 3

i:2j10
NB. _2 _1.6 _1.2 _0.8 _0.4 0 0.4 0.8 1.2 1.6 2

i:10      
NB.  _9 _8 _7 _6 _5 _4 _3 _2 _1 0 1 2 3 4 5 6 7 8 9 10

i:1j10
NB. _1 _0.8 _0.6 _0.4 _0.2 0 0.2 0.4 0.6 0.8 1

dissect'plot (;(sin,:cos)@:^) -: >: i:3j100'
   
NB. Free fall
g =: 9.81 NB. m/s^2
g
NB. 9.81

h =: {{ 0.5*g*y^2 }} NB. h is the height of the fall in y seconds.
h 10
NB. 490.5

h i.11
NB. 0 4.905 19.62 44.145 78.48 122.625 176.58 240.345 313.92 397.305 490.5
time =: i.101
height =: h time
plot height time

NB. Gamma function 3D plot
gamma=: !@<:
real=: {.@+.
x=: i:4j40
y=: i:1j40
z=: real gamma x j./ y
dat=: _3 >. 12 <. z

'surface;noaxes;viewpoint _1 _2.5 1' plot dat
'surface;noaxes;viewpoint _5 _2.5 1' plot dat
'surface;noaxes;viewpoint _10 _2.5 1' plot dat
'surface;noaxes;viewpoint 1 _2.5 1' plot dat
'surface;noaxes;viewpoint 5 _2.5 1' plot dat
'surface;noaxes;viewpoint 10 _2.5 1' plot dat

imag =: {:@+.
z_im =: imag gamma x j./ y
dat_im =: _3 >. 4 <. z_im
NB.
'surface;noaxes;viewpoint _1 _2.5 1' plot dat_im
'surface;noaxes;viewpoint _5 _2.5 1' plot dat_im
'surface;noaxes;viewpoint _10 _2.5 1' plot dat_im
'surface;noaxes;viewpoint 1 _2.5 1' plot dat_im
'surface;noaxes;viewpoint 5 _2.5 1' plot dat_im
'surface;noaxes;viewpoint 10 _2.5 1' plot dat_im


NB. 03. Basic linear algebra with J

NB. A random 3x3 matrix:
A=: 1 + (3 3 $ 9?9)
A
$A

A_T=: |: A
A_T

A +./ . *. A_T

inv =: %.

inner=: +/ . * NB. Inner product

A inner (%. A)

(1 2 3) inner (3 4 5)
NB. 26
(1*3) + (2*4) + (3*5)
NB. 26

is_square=: {{ =/$ y }}

is_square A
A

NB. ;: '=/$ A'
NB. dissect '=/$A'


det=: -/ . *

det 2 2 $ 1 2 3 4

2 2 $ 1 2 3 4
NB. 1 2
NB. 3 4
(1*4) - (2*3)
NB. _2

NB. A random 1x3 array:
b=: 3?9
b


NB. Polynomials and roots:

c=: 1 0 1 NB. 1*x^0 + 0*x^1 + 1*x^2 = 0
p. c NB. Calc the roots of the polynomial with coefficients c
NB. ┌─┬────────┐
NB. │1│0j1 0j_1│
NB. └─┴────────┘
   
c2=: _6 71 _321 694 _720 288
p. c2
NB. ┌───┬───────────────────────────────┐
NB. │288│0.75 0.666667 0.5 0.333333 0.25│
NB. └───┴───────────────────────────────┘
NB.    


NB. =============================================================================================================================================

NB. Sources & further reading
NB. 01. https://code.jsoftware.com/wiki/User:Devon_McCormick/MinimalBeginningJ, by Devon McCormick.
NB. 02. https://code.jsoftware.com/wiki/Studio/Gallery
NB. 03. Viewmat:
NB.     https://code.jsoftware.com/wiki/Studio/Viewmat
NB.     https://code.jsoftware.com/wiki/Scripts/Viewmat_Spy
NB. 04. Plot:
NB.     https://code.jsoftware.com/wiki/Plot
NB.     https://code.jsoftware.com/wiki/Plot/Examples
NB.     https://code.jsoftware.com/wiki/Plot/Contrib	
NB. 05. Linear algebra: https://code.jsoftware.com/wiki/Books#Exploring_Math
NB. 06. JPrimer, by Eric: https://www.jsoftware.com/help/primer/contents.htm
NB. 07. An Implementation of J, by Roger: https://www.jsoftware.com/ioj/ioj.htm


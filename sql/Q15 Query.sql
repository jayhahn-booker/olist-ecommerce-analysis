With revenue
_
table As (
2 Select
3 seller
_
id,
4 sum(price) As total
revenue
_
5 From
6 olist
order
items
_
dataset
_
_
7 Group by
8 seller
id
_
9 ),
10 ranked
_
sellers As (
11 Select
12 seller
_
id,
13 total
_
revenue,
14 row
_
number() Over (Order by total
_
revenue DESC) As seller
_
15 From
16 revenue
table
_
17 ),
18 platform
_
total As (
19 Select
20 Sum(total
_
revenue) As business
total
_
21 From
22 revenue
table
_
23 )
24 Select
25 Round(Sum(total
_
revenue) / business
_
total *100.0, 2) as pct
of
_
_
26 From
27 ranked
_
sellers, platform
_
total
28 Where
29 seller
rank <= 309
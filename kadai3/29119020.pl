%rep02: 第02回 演習課題レポート
%2019年04月24日 by 29119020 名前:下村利理雄
%
%練習3.1 リストを扱うプログラム(テキスト72ページ)
% [述語の説明]
%conc(L1,L2,L3):リストL1とリストL2を連接し、リストL3を作る
conc([],L2,L2).
conc([X|L1],L2,[X|L3]) :- conc(L1,L2,L3).
/*
 (実行例)
 ?- conc(L1,[_,_,_],[a,b,c,d]).
   Call: (8) conc(_9202, [_9160, _9166, _9172], [a, b, c, d]) ? creep
   Call: (9) conc(_9490, [_9160, _9166, _9172], [b, c, d]) ? creep
   Exit: (9) conc([], [b, c, d], [b, c, d]) ? creep
   Exit: (8) conc([a], [b, c, d], [a, b, c, d]) ? creep
L1 = [a] .

?- conc([_,_,_|L2],[_,_,_],[a,b,c,d,e,f,g,h,i]).
   Call: (8) conc([_10912, _10918, _10924|_10926], [_10930, _10936, _10942], [a, b, c, d, e, f, g, h|...]) ? creep
   Call: (9) conc([_10918, _10924|_10926], [_10930, _10936, _10942], [b, c, d, e, f, g, h, i]) ? creep
   Call: (10) conc([_10924|_10926], [_10930, _10936, _10942], [c, d, e, f, g, h, i]) ? creep
   Call: (11) conc(_10926, [_10930, _10936, _10942], [d, e, f, g, h, i]) ? creep
   Call: (12) conc(_11368, [_10930, _10936, _10942], [e, f, g, h, i]) ? creep
   Call: (13) conc(_11374, [_10930, _10936, _10942], [f, g, h, i]) ? creep
   Call: (14) conc(_11380, [_10930, _10936, _10942], [g, h, i]) ? creep
   Exit: (14) conc([], [g, h, i], [g, h, i]) ? creep
   Exit: (13) conc([f], [g, h, i], [f, g, h, i]) ? creep
   Exit: (12) conc([e, f], [g, h, i], [e, f, g, h, i]) ? creep
   Exit: (11) conc([d, e, f], [g, h, i], [d, e, f, g, h, i]) ? creep
   Exit: (10) conc([c, d, e, f], [g, h, i], [c, d, e, f, g, h, i]) ? creep
   Exit: (9) conc([b, c, d, e, f], [g, h, i], [b, c, d, e, f, g, h, i]) ? creep
   Exit: (8) conc([a, b, c, d, e, f], [g, h, i], [a, b, c, d, e, f, g, h|...]) ? creep
L2 = [d, e, f] .
[説明, 考察]
(a)まず、リストが3つの要素を持つことを探索する。そのあと、余った要素をL1に代入する。以上を満たすように、リストが3つの要素でる変数は、内容を問わないために無名変数で定義する。
(b)(a)を応用し、(a)のL1のリストを内容を変更する。先頭の3つの要素と尾部をリストの長さを問わないL2を定義する。このとき、先頭の内容を知る必要がないため、無名変数で定義する。以上を行うことで、先頭3つの要素は取得せず、尾部のL2の変数の結果を得ることができる。
*/
%練習3.2 リスト最後の要素を取得するプログラム(テキスト73ページ)
% [述語の説明]
%lasa(Item,List):ItemはListの最後の要素である。(conc使用)
%lasb(Item,List):ItemはListの最後の要素である。(conc未使用)
lasa(Item,List) :- conc(_,[Item],List).
lasb(Item,[Item]).
lasb(Item,[_|Tail]) :- lasb(Item,Tail).
/*
 (実行例)
  ?- lasa(c,[a,b,c]).
   Call: (8) lasa(c, [a, b, c]) ? creep
   Call: (9) conc(_4624, [c], [a, b, c]) ? creep
   Call: (10) conc(_4612, [c], [b, c]) ? creep
   Call: (11) conc(_4618, [c], [c]) ? creep
   Exit: (11) conc([], [c], [c]) ? creep
   Exit: (10) conc([b], [c], [b, c]) ? creep
   Exit: (9) conc([a, b], [c], [a, b, c]) ? creep
   Exit: (8) lasa(c, [a, b, c]) ? creep
true .

?- lasa(a,[a,b,c]).
   Call: (8) lasa(a, [a, b, c]) ? creep
   Call: (9) conc(_6772, [a], [a, b, c]) ? creep
   Call: (10) conc(_6760, [a], [b, c]) ? creep
   Call: (11) conc(_6766, [a], [c]) ? creep
   Call: (12) conc(_6772, [a], []) ? creep
   Fail: (12) conc(_6772, [a], []) ? creep
   Fail: (11) conc(_6766, [a], [c]) ? creep
   Fail: (10) conc(_6760, [a], [b, c]) ? creep
   Fail: (9) conc(_6772, [a], [a, b, c]) ? creep
   Fail: (8) lasa(a, [a, b, c]) ? creep
false.

?- lasb(c,[a,b,c]).
   Call: (8) lasb(c, [a, b, c]) ? creep
   Call: (9) lasb(c, [b, c]) ? creep
   Call: (10) lasb(c, [c]) ? creep
   Exit: (10) lasb(c, [c]) ? creep
   Exit: (9) lasb(c, [b, c]) ? creep
   Exit: (8) lasb(c, [a, b, c]) ? creep
true .
[説明, 考察, 評価]
(a)まず、Itemを含むリストとListリストがマッチするように探索をする。もしマッチしたら真になり、マッチしない場合は偽とするように定義する。
(b)まず、Itemを含むItemリストが存在する場合を真とする。次に、Listリストを再帰的に呼び出す。Listリストは頭部(内容は問わないため無名変数)と尾部に分かれる。そして、Listリストの尾部だけを用いて、探索する。
*/
%問題3.4 リストを反転させるプログラム(テキスト79ページ) 
%rev(List,ReversedList):ReversedListはListを反転させたものである。
rev([],[]).
rev([Head|Tail],ReversedList) :-
    rev(Tail,ReversedTail),
    conc(ReversedTail,[Head],ReversedList).
/*
 (実行例)
?- rev([a,b],[b,a]).
   Call: (8) rev([a, b], [b, a]) ? creep
   Call: (9) rev([b], _7546) ? creep
   Call: (10) rev([], _7546) ? creep
   Exit: (10) rev([], []) ? creep
   Call: (10) conc([], [b], _7554) ? creep
   Exit: (10) conc([], [b], [b]) ? creep
   Exit: (9) rev([b], [b]) ? creep
   Call: (9) conc([b], [a], [b, a]) ? creep
   Call: (10) conc([], [a], [a]) ? creep
   Exit: (10) conc([], [a], [a]) ? creep
   Exit: (9) conc([b], [a], [b, a]) ? creep
   Exit: (8) rev([a, b], [b, a]) ? creep
true.
[説明, 考察]
まず、それぞれのリストが空の時、真にする。もし、空でないなら次の動作を行う。はじめに、反転したいリストを頭部と尾部で分ける。そして、尾部と反転したリストの尾部で再帰的に行う。そして、反転したリストの尾部と頭部を連接したリストを反転したリストを作る。
*/
%問題3.9 Listの要素がほぼ同じ長さのList1とList2に分割されるプログラム(教科書p.79)
%dividelist(List,List1,List2):ListをList1とList2を同じ長さになるように分割する。
divlist([],[],[]).
divlist([X],[X],[]).
divlist([X,Y|List0],[X|List1],[Y|List2]) :-
    divlist(List0,List1,List2).
/*
 (実行例)
?- divlist([a,b,c,d],L1,L2).
   Call: (8) divlist([a, b, c, d], _3688, _3690) ? creep
   Call: (9) divlist([c, d], _3960, _3966) ? creep
   Call: (10) divlist([], _3972, _3978) ? creep
   Exit: (10) divlist([], [], []) ? creep
   Exit: (9) divlist([c, d], [c], [d]) ? creep
   Exit: (8) divlist([a, b, c, d], [a, c], [b, d]) ? creep
L1 = [a, c],
L2 = [b, d].

 ?- divlist(L1,[a,b,c],[1,2,3]).
   Call: (8) divlist(_7538, [a, b, c], [1, 2, 3]) ? creep
   Call: (9) divlist(_7800, [b, c], [2, 3]) ? creep
   Call: (10) divlist(_7812, [c], [3]) ? creep
   Call: (11) divlist(_7824, [], []) ? creep
   Exit: (11) divlist([], [], []) ? creep
   Exit: (10) divlist([c, 3], [c], [3]) ? creep
   Exit: (9) divlist([b, 2, c, 3], [b, c], [2, 3]) ? creep
   Exit: (8) divlist([a, 1, b, 2, c, 3], [a, b, c], [1, 2, 3]) ? creep
L1 = [a, 1, b, 2, c, 3].
[説明, 考察]
分割したいリストが空なら、分割後の両リストも空とする。また、分割したいリストが要素を一つしか持たない場合、片方のリストに代入する。そして、分割したいリストが要素を2つ以上なら、その頭部の2つの要素を他のリストに頭部に分ける。また、それぞれのリストで余った尾部は、再度分割するために、再帰的に呼び出しを行う。
*/

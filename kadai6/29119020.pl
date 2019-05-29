%rep05: 第05回 演習課題レポート
%2019年05月22日 by 29119020 名前:下村理雄
%
%練習5.2 正数・零・負数分類プログラム(テキスト133ページ)
% [述語の説明]
%class(Number,type):NumberはTypeと分類される。なお、Typeはいかに定義する。
% positive:正数
%     zero:  零
% negative:負数
class(Number,positive) :- 
	Number>0,!.
class(0,Zero) :- !.
class(Number,negative).
/*
 (実行例)
?- class(-1,positive).
false.

?- class(1,zero).
false.

?- class(1,positive).
true.


[説明, 考察, 評価]
今回の条件として、もしNumberが正数でありpositiveなら成立する。そうでないとき、Numberが0であり零なら成立。もし、そうでないときはこの時点で正数でも零でもない数字である負数であることがわかる。それを実装するために、教科書の5章本文を参照しながら定義した。
*/
%練習5.3 数リストを自然数リストと負数リストに分割するプログラム(テキスト133ページ)
% [述語の説明]
%split(Numbers,Positive,Negative):NumbersはPositive(自然数)とNegative(負数)に分割できる。
splitA([],[],[]).
splitA([X|L],[X|L1],L2) :-
	X >= 0,!,
	splitA(L,L1,L2).
splitA([X|L],L1,[X|L2]) :-
	splitA(L,L1,L2).
splitB([],[],[]).
splitB([X|L],[X|L1],L2) :-
	X >= 0,
	splitB(L,L1,L2).
splitB([X|L],L1,[X|L2]) :-
	X < 0,
	splitB(L,L1,L2).
/*
 (実行例)
?- splitA([3,-1,0,5,-2],L1,L2).
L1 = [3, 0, 5],
L2 = [-1, -2].

?- splitB([3,-1,0,5,-2],L1,L2).
L1 = [3, 0, 5],
L2 = [-1, -2] ;
false.

[説明, 考察, 評価]
splitAの終了条件として、全部が空リストであるときである。条件として、Listの中の頭部とList1の頭部であるXが自然数であるなら成立し、そうでないとき、Listの頭部とList2の頭部であるXが成立するように定義する。以上のことから、一つ目の条件である自然数については、
splitA([X|L],[X|L1],L2) :-
	X >= 0,!,
	splitA(L,L1,L2).
である「X >= 0,!,」の部分で定義する。これは、Xが0以上であるなら次の条件に遷移し、そうでないならカットするようになっている。カットされれば、次の条件である負数という定義でバックトラックを行う。
次にspliteBについては、それぞれの条件に合致するように条件付け加える必要がある。つまり、
splitB([X|L],L1,[X|L2]) :-
	splitB(L,L1,L2).
の部分を
splitB([X|L],L1,[X|L2]) :-
	X < 0,
	splitB(L,L1,L2).
とする必要がある。このようにする理由は、この条件がないとList2のほうに正数が含まれる可能性をつくってしまうためである。
*/
%練習5.6 具体化なしでリストをマッチするプログラム(テキスト137ページ)
% [述語の説明]
%canunify(List1,Term,Kist2):List2はTermとマッチするList1の要素からなるリストである。
%naf(P):Pが成立するなら偽、成立しないなら真なる。
naf(P) :- P,!,fail.
naf(_).
canunify([],_,[]).
canunify([Head|Tail],Term,List) :-
	naf(Head=Term),!,
	canunify(Tail,Term,List).
canunify([Head|Tail],Term,[Head|List]) :-
	canunify(Tail,Term,List).
/*
 (実行例)
 ?- canunify([X,b,f(Y)],f(b),List).
List = [X, f(Y)].

[説明, 考察, 評価]
まずcanunifyの終了条件として、canunify(空リスト,変数,空リスト)となることである。条件としてまず、HeadとTermがマッチしないとき、再帰的にconunifyをList1の尾部とList2とTermにおいて実行する。ここで、もしHeadとTermが成立してしまう場合は、List1の頭部とList2の頭部が一致するに対し、再帰的にconunifyをList1の尾部とList2の尾部とTermにおいて実行する。
*/

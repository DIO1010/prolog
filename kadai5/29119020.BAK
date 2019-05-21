%rep04: 第04回 演習課題レポート
%2019年05月15日 by 29119020 名前:下村理雄
%
%練習4.2 双子といとこを求めるプログラム(テキスト98ページ)
% [述語の説明]
% family(X,Y,Z):この家族はXが父、Yは母、Zは子供リストである。
% husband(X):Xは父である。
% wife(X):Xは母である。
% child(X):Xは子供である。
% member(X,L):XはリストLのメンバーである。
% dateofbirth(X,Y):XはYの誕生日である。
% exists(X):Xは存在する。
% del(X,List1,List2):List1の要素Xを削除したリストはList2である。
% twins(X,Y):XとYは双子である。
% cousin(X,Y):XはYの従兄弟である。
family(
	person(m1,a1,date(7,may,1950)),
	person(f1,a1,date(9,may,1951)),
	[person(m2,a1,date(5,may,1973)),
	 person(f2,a1,date(5,may,1973))]).

family(
	person(m3,a2,date(5,may,1973)),
	person(f2,a2,date(10,may,1974)),
	[person(m4,a2,date(31,may,1994)),
	 person(f3,a2,date(6,may,1995)),
	 person(m5,a2,date(7,may,1996)),
	 person(f4,a2,date(7,may,1996))]).

family(
	person(m2,a1,date(5,may,1973)),
	person(f5,a1,date(21,may,1971)),
	[person(m6,a1,date(23,may,1997))]).

husband(X) :-
	family(X,_,_).

wife(X) :-
	family(_,X,_).

child(X) :-
	family(_,_,Children),
	member(X,Children).

member(X,[X|_]).
member(X,[_|L]) :-
	member(X,L).

dateofbirth(person(_,_,Date),Date).

exists(P) :-
	husband(P);
	wife(P);
	child(P).

del(X,[X|Tail],Tail).
del(X,[Y|Tail],[Y|Tail1]) :-
	del(X,Tail,Tail1).

twins(Child1,Child2) :-
	family(_,_,Children),
	del(Child1,Children,OtherChildren),
	member(Child2,OtherChildren),
	dateofbirth(Child1,Date),
	dateofbirth(Child2,Date).

cousin(P1,P2) :-
	family(_,_,GrandChildren),
	del(person(Name1,_,_),GrandChildren,OtherGrandChildren),
	member(person(Name2,_,_),OtherGrandChildren),
	family(person(Name1,_,_),_,Children1),
	member(P1,Children1),
	family(person(Name2,_,_),_,Children2),
	member(P2,Children2).

cousin(P1,P2) :-
	family(_,_,GrandChildren),
	del(person(Name1,_,_),GrandChildren,OtherGrandChildren),
	member(person(Name2,_,_),OtherGrandChildren),
	family(person(Name1,_,_),_,Children1),
	member(P1,Children1),
	family(_,person(Name2,_,_),Children2),
	member(P2,Children2).

cousin(P1,P2) :-
	family(_,_,GrandChildren),
	del(person(Name1,_,_),GrandChildren,OtherGrandChildren),
	member(person(Name2,_,_),OtherGrandChildren),
	family(_,person(Name1,_,_),Children1),
	member(P1,Children1),
	family(_,person(Name2,_,_),Children2),
	member(P2,Children2).

/*
 (実行例)
?- twins(X,Y).
X = person(m2, a1, date(5, may, 1973)),
Y = person(f2, a1, date(5, may, 1973)) ;
X = person(f2, a1, date(5, may, 1973)),
Y = person(m2, a1, date(5, may, 1973)) ;
X = person(m5, a2, date(7, may, 1996)),
Y = person(f4, a2, date(7, may, 1996)) ;
X = person(f4, a2, date(7, may, 1996)),
Y = person(m5, a2, date(7, may, 1996)) ;
false.

?- cousin(X,Y).
X = person(m6, a1, date(23, may, 1997)),
Y = person(m4, a2, date(31, may, 1994)) ;
X = person(m6, a1, date(23, may, 1997)),
Y = person(f3, a2, date(6, may, 1995)) ;
X = person(m6, a1, date(23, may, 1997)),
Y = person(m5, a2, date(7, may, 1996)) ;
X = person(m6, a1, date(23, may, 1997)),
Y = person(f4, a2, date(7, may, 1996)) ;
false.

[説明, 考察, 評価]

双子である関係を見つけるために、まず、Child1とChild2はどこかの家族に属している必要がある。次に、そのChild1とChild2が同一人物である可能性があるため、それを除外するためにその家族のChldrenのリストからChild1を除外したChildrenのOtherChildrenのリストにする。その後、OtherChildrenにChild2があるか調べる。そして、Child1の誕生日とChild2の誕生日が一緒になる組み合わせを調べる。
次に従兄弟関係を求めるために、まず、どこかの家族のGrandChildrenについて調べる。ここで、Name1の名を持つ親とする家族を探索する。しかし、Name2と共通な名を参照しりことを防ぐために、Name1を名とする人を除いたGrandChildrenのリストであるOtherGrandChildrenについて探索する。そして、Name1の名を持つ親とする家族のChildren1を探索する。P1はChildren1に属するかを確認する。次に、OtherGrandChildrenの中の人を親とし、かつ、Name2を名とする人の家族のChildren2を探索する。その中にP2が属した場合、真となる。ここで、GrandChildとOtherGrandChildrenの中の人が母親か父親かどっちでも構わないので、三通りの選択肢を用意させる。
*/
%練習4.5 非決定性オートマトンの無限ループを回避するプログラム(テキスト105ページ)
% [述語の説明]
final(s3).

trans(s1,a,s1).
trans(s1,a,s2).
trans(s1,b,s1).
trans(s2,b,s3).
trans(s3,b,s4).

silent(s2,s4).
silent(s3,s1).

accepts(S,[],_) :-
	final(S).
	
accepts(S,[X|Rest],Max_moves) :-
	Max_moves > 0,
	trans(S,X,S1),
	Next_max_moves is Max_moves - 1,
	accepts(S1,Rest,Next_max_moves).
	
accepts(S,String,Max_moves) :-
	Max_moves > 0,
	silent(S,S1),
	Next_max_moves is Max_moves - 1,
	acceots(S1,String,Next_max_moves).
/*
 (実行例)
?- accepts(s1,[a,a,b],5).
true .

[説明, 考察, 評価]
今回の工夫点として、Max_movesが0になることが無いように条件を加えたことと、再帰行うときのMax_movesは(Max_moves-1)したNext_max_movesであるため、次のMax_movesとして行う。また、final(S)に到達したときは無条件に受理するようにした。
*/
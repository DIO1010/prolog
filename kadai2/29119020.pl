%rep01: 第01回 演習課題レポート
%2019年04月17日 by 29119020 名前:下村利理雄
%
%練習1.2 家族関係を解くプログラム(テキスト6ページ)
% [述語の説明]
%parent(X,Y):XはYの親である。
%female(X):Xは女性である
%male(X):Xは男性である。
%different(X,Y):XはYとは違う
%offspring(Y,X):YはXの子孫である
%mather(X,Y):XはYの母親である
%grandfather(X,Z):XはZの祖父母である。
%sister(X,Y):XはYと姉妹である。
%precessor(X,Z):XはZの祖先である
parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).

female(pam).
male(tom).
male(bob).
female(liz).
female(ann).
female(pat).
male(jim).

different(X,Y) :-
    X \== Y.

offspring(Y,X) :-
    parent(X,Y).

mather(X,Y) :-
    parent(X,Y),
    female(X).

grandparent(X,Z) :-
    parent(X,Y),
    parent(Y,Z).

sister(X,Y) :-
    parent(Z,X),
    parent(Z,Y),
    female(X),
    different(X,Y).

predecessor(X,Z) :-
    parent(X,Z).

predecessor(X,Z) :-
    parent(X,Y),
    parent(Y,Z).
/*
 (実行例)
?- parent(X,pat).
X = bob.

?- parent(liz,X).
false.

?- grandparent(X,pat).
X = pam .

[説明, 考察]
(a)の質問は「Xはpatの親であり、Xを答えろ」と同義なので以上のような実行結果になった。つまり、patん親はbobである。
(b)の質問は「lizはXの親であり、Xを答えろ」と同義なので以上のように実行結果になった。つまり、lizの子はいないことになる。
(c)の質問は「Xはpatの祖父母であり、Xを答えろ」と同義なので以上のような実行結果となった。つまり、patの祖父母はpamである。
*/

%練習1.5 叔母のルールを追加したプログラム(テキスト12ページ)
% [述語の説明]
%aunt(X,Y):XはYの叔母である。
aunt(X,Y) :-
    sister(X,Z),
    parent(Z,Y).
/*
 (実行例)
?- aunt(X,ann).
X = liz .

[説明, 考察]
aunt(X,Y)を判断するにには、まず、Xが誰か姉妹がいるかどうか確認する必要がある。つまり、sister(X,Z)でXはZと姉妹であることを判断する。また、その姉妹がそのYの親である必要があるために、parent(Z,Y)でZはYの親であることを判断する必要がある。よって、以上のようなルールになり、試用として、annん叔母が誰であるかを確認した。
*/

%練習1.6 祖先のルールを変更したものを追加したプログラム(テキスト18ページ)
% [述語の説明]
%predecessor2(X,Z):XはZの祖先である。
predecessor2(X,Z) :-
    parent(X,Z).

predecessor2(X,Z) :-
        parent(Y,Z),
        predecessor2(X,Y).
/*
 (実行例)
?- predecessor(X,ann).
X = bob ;
X = pam ;
X = tom ;
false.

?- predecessor2(X,ann).
X = bob ;
X = pam ;
X = tom ;
false.

[説明, 考察]
predecessor2(X,Z)は、XとZが親であるなら、XはZの親である。また、YはZの親であり、かつ、XはYの祖先であるなら、XはZの祖先であるともルールづけている。predecessorとpredecessor2は同じ結果になるので、定義としては適切である。しかし、この新しい定義のグラフはXとYが祖先であることから、再帰的に求めているため、図1.7と対応つけることはできない。
*/
							      
%練習2.1 どんな種類のオブジェクトか(テキスト34ページ)
/*
[説明, 考察]
(a)
 頭文字が大文字のため、変数である。
(b)
 頭文字が小文字のため、アトムである。
(c)
 クウォーテーションで挟まれているため、アトムである。
(d)
 アンダーバーがついているため、変数である。
(e)
 クウォーテーションで挟まれているため、アトムである。
(f)
 複数の成分(ここでは、dianaとsouth)を括弧でくくってあるため、構造である。
(g)
 数字であるため、数である。
(h)
 複数の成分を括弧でくくってあるが頭文字が数字であるため、構文的に正しくない。
(i)
 複数の成分を括弧でくくってあるため、構造である。
(j)
 構造の成分を括弧でくくってあるため、構造である。
*/

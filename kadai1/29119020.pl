%rep00: 第00回 演習課題レポート
%2019年4月10日 by 29119020 名前:下村利理雄
%
%練習X,Y 家族関係を解くプログラム
% [述語の説明]
%parent(X,Y) : XはYの親である
%father(X,Y) : XはYの父親である
%ancestor(X,Y) : XはYの祖先である
%male(X) : Xは男性である
% /* ここから本当のPrologプログラムを書く */
parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
male(tom).
male(bob).
father(X,Y) :- parent(X,Y),male(X).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z),ancestor(Z,Y).
/*
 (実行例)
?- ancestor(X,ann).
X = bob ;
X = pam .

?- father(X,ann).
X = bob.
*/

/*
[説明, 考察]
annの祖先は、pamであることがわかった。これは、annの親がbobであり、そのbobの親がpamであることから、判断できた。
annの父親はbobであることがわかった。これは、annの親であり、かつ、男性である個体定数で判断している。
*/

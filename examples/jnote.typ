#import "../styles/jnote.typ" : *
#show: jnote.with(
  title: "jnote.typのサンプルドキュメント",
  author: "藤原 和将",
  date: "2025-07-18"
 )


= 線形代数入門
== ベクトル空間
=== 定義と基本性質

#definition(title: "ベクトル空間", id: "vector-space")[
  体 $K$ 上のベクトル空間とは、加法とスカラー倍が定義された集合 $V$ で、
  以下の公理を満たすものである：...
]

#theorem(title: "基底の存在", id: "basis-existence")[
  任意の有限次元ベクトル空間は基底を持つ。
]

#proof[
  数学的帰納法を用いる。
  
  次元が1の場合は自明。
  
  ...
]

#proposition(title: "部分空間の性質")[
  ベクトル空間の部分集合が部分空間であるための必要十分条件は...
]

#lemma(title: "線形独立性")[
  ベクトル $v_1, ..., v_n$ が線形独立であるための条件は...
]

#corollary(title: "次元の一意性")[
  ベクトル空間の基底の要素数は一意に定まる。
]

#proof[
@basis-existence
から....
]

#remark(title: "無限次元の場合")[
  無限次元ベクトル空間では、...
]

#example(title: "実数体上のベクトル空間")[
  $RR^n$ は実数体上の $n$ 次元ベクトル空間である。
  標準基底は $e_1 = (1,0,...,0), ..., e_n = (0,...,0,1)$ である。
]
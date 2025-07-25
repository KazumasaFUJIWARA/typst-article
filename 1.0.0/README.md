# 学術論文スタイル (article.typ)

[🔙readme](../README.md)

## 概要

`article.typ`は学術論文の作成に特化したTypstスタイルファイルです.
amsartクラスを参考に設計され, 論文の標準的な構成要素（タイトル、著者情報、アブストラクト、定理など）を表示します.

## 機能

### 主要な関数

#### `article(title, author, affiliation, email, date, abstract, keywords)`
学術論文全体を包むメイン関数です。
- **引数**:
  - `title` - 論文タイトル（オプション）
  - `author` - 著者名（オプション）
  - `affiliation` - 所属機関（オプション）
  - `email` - メールアドレス（オプション）
  - `date` - 日付（オプション）
  - `abstract` - アブストラクト（オプション）
  - `keywords` - キーワード（オプション）
- **機能**: 
  - A4用紙、25mmマージン、10ptフォントサイズを設定
  - Times New Romanフォントを使用
  - 見出し番号を自動付与（1.1.1形式）
  - タイトル、著者情報、アブストラクトを自動配置
  - `#show: article.with(...)` で使用

#### `theorem(title, id, it)`
定理を表示する関数です。
- **引数**:
  - `title` - 定理のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 定理の内容
- **表示**: 通常のブロック、定理内容は斜体表示

#### `lemma(title, id, it)`
補題を表示する関数です。
- **引数**:
  - `title` - 補題のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 補題の内容
- **表示**: 通常のブロック

#### `proposition(title, id, it)`
命題を表示する関数です。
- **引数**:
  - `title` - 命題のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 命題の内容
- **表示**: 通常のブロック

#### `corollary(title, id, it)`
系を表示する関数です。
- **引数**:
  - `title` - 系のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 系の内容
- **表示**: 通常のブロック

#### `definition(title, id, it)`
定義を表示する関数です。
- **引数**:
  - `title` - 定義のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 定義の内容
- **表示**: 通常のブロック

#### `remark(title, id, it)`
註を表示する関数です。
- **引数**:
  - `title` - 註のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 註の内容
- **表示**: 通常のブロック

#### `example(title, id, it)`
例を表示する関数です。
- **引数**:
  - `title` - 例のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 例の内容
- **表示**: 12ptの内側余白付きブロック

#### `proof(title, id, it)`
証明を表示する関数です。
- **引数**:
  - `title` - 証明のタイトル（オプション）
  - `id` - 参照用のID（オプション）
  - `it` - 証明の内容
- **表示**: 左側に5ptのパディング、「Proof」で開始、末尾に□（証明終了記号）

### 使用例

```typ
#import "styles/article.typ": *
#show: article.with(
  title: "論文タイトル",
  author: "著者名",
  affiliation: "所属機関",
  abstract: "アブストラクト...",
  keywords: "キーワード1, キーワード2"
)

= Introduction
序論の内容...

== 第1章
=== 1.1節

#theorem(title: "重要な定理", id: "main-theorem")[
  定理の内容...
]

#proof(id: "main-proof")[
  証明の内容...
]
```

## 使用例

以下は完全な使用例です('{name-space}`を`local`)にした場合：

```typ
#import "@local/typst-article:1.0.0": *

#show: article.with(
title: "On the Convergence of Iterative Methods",
author: "John Doe",
affiliation: "Department of Mathematics, University of Example",
email: "john.doe@example.edu",
date: "January 2024",
abstract: "We investigate the convergence properties of various iterative methods for solving linear systems. Our main result establishes a new sufficient condition for convergence that generalizes previous work in this area.",
keywords: "iterative methods, convergence, linear systems, numerical analysis",
)

= Introduction
Iterative methods play a crucial role in solving large-scale linear systems that arise in scientific computing and engineering applications.
  
#definition(title: "Iterative Method", id: "iterative-method")[
An iterative method for solving $A x = b$ is a sequence of approximations ${x_k}$ generated by the recurrence relation
$x_{k+1} = B x_k + c$
where $B$ is the iteration matrix and $c$ is a constant vector.
]
  
#theorem(title: "Convergence Criterion", id: "convergence-criterion")[
The iterative method converges if and only if the spectral radius of the iteration matrix satisfies $rho(B) < 1$.
]
  
#proof(id: "main-proof")[
Let $e_k = x_k - x^*$ be the error at iteration $k$, where $x^*$ is the exact solution.
Then $e_{k+1} = B e_k$, which implies $e_k = B^k e_0$.
The method converges if and only if $lim_(k-> oo ) B^k = 0$,
which is equivalent to $rho(B) < 1$.
]
    
= Analysis of Specific Methods
== Jacobi Method
The Jacobi method uses the iteration matrix $B = D^(-1)(L + U)$ where $A = D - L - U$.
    
#proposition(title: "Jacobi Convergence", id: "jacobi-convergence")[
If $A$ is strictly diagonally dominant, then the Jacobi method converges.
]
  
#proof(id: "jacobi-proof")[
For strictly diagonally dominant matrices, we have $|a_(i i)| > sum_(j!=i) |a_(i j)|$ for all $i$.
This implies $rho(B) < 1$ by the Gerschgorin circle theorem.
]

== Gauss-Seidel Method
The Gauss-Seidel method typically converges faster than Jacobi for the same matrix.
  
#lemma(title: "Comparison Lemma", id: "comparison-lemma")[
For any matrix $A$, the spectral radius of the Gauss-Seidel iteration matrix is less than or equal to that of the Jacobi iteration matrix.
]
  
#corollary(title: "Gauss-Seidel Convergence", id: "gauss-seidel-convergence")[
If the Jacobi method converges, then the Gauss-Seidel method also converges.
]
  
= Numerical Examples
== Simple 2x2 System
Consider the system
  $((2, 1), (1, 3)) ((x_1), (x_2)) = ((5), (6))$
This matrix is strictly diagonally dominant, so both Jacobi and Gauss-Seidel methods converge.

#remark(title: "Implementation Note", id: "implementation-note")[
In practice, one should check the condition number of the matrix as well as the spectral radius to predict convergence behavior.
]
```
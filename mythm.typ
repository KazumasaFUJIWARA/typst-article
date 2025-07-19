#let thmcounter = counter("theorem")

#set heading(numbering: "1.")

#show outline.entry.where(
	level: 1
): set block(above: 1.5em)

// level 1ヘッダーの更新時のみ変更
#show heading.where(level: 1): it => {
	counter(math.equation).update(0)
	counter(figure.where(kind: image)).update(0)
	counter(figure.where(kind: table)).update(0)
	counter(figure.where(kind: raw)).update(0)
	thmcounter.update(0)
	it
}


#set math.equation(
	numbering: num =>
		numbering("(1.1)", counter(heading).get().first(), num),
		number-align: bottom
)

#set figure(
	numbering: num =>
		numbering("1.1", counter(heading).get().first(), num)
)

// 引用文の左に線を引く
#set quote(block: true)
#show quote.where(block: true): block.with(
	stroke: (left: 2pt + blue, rest: none),
)

#show link: set text(fill: blue)

// まず「3バッククォート以上なら必ず block 表示」に
#set raw(block: true)

// GPT ライトテーマ風
#show raw.where(block: true): block.with(
	fill: rgb("#f6f8fa"),
	inset: (x: 12pt, y: 8pt),
	radius: 4pt,
)

// インラインコードも色を合わせたい場合
#show raw.where(block: false): box.with(
	fill: rgb("#f6f8fa"),
	inset: (x: 3pt, y: 1pt),
	radius: 3pt,
)

#let thetheoremcounter = {
	thmcounter.step()
	context str(counter(heading).get().first()) + "." + context thmcounter.display()
}

#let definition(title: none, it) = context {

	block(
		radius: 4pt,
		inset: 10pt,
		fill: silver,
		width: 100%,
	)[
		#strong("定義" + thetheoremcounter + ": " + title)\
		#v(-0.3em)
		#it
	]
}

#let theorem(title: none, it) = context {

	block(
		radius: 4pt,
		inset: 10pt,
		width: 100%,
		stroke: (2pt + black),
	)[
		#strong("定理" + thetheoremcounter + ": " + title)\
		#v(-0.3em)
		#it
	]
}

#let proposition(title: none, it) = context {

	block(
		radius: 4pt,
		inset: 10pt,
		fill: luma(250),
		width: 100%,
		stroke: (2pt + gray),
	)[
		#strong("命題" + thetheoremcounter + ": " + title)\
		#v(-0.3em)
		#it
	]
}

#let lemma(title: none, it) = context {

	block(
		radius: 4pt,
		inset: 10pt,
		width: 100%,
		stroke: (4pt + silver),
	)[
		#strong("補題" + thetheoremcounter + ": " + title)\
		#v(-0.3em)
		#it
	]
}

#let corollary(title: none, it) = context {

	block(
		radius: 4pt,
		inset: 10pt,
		width: 100%,
		stroke: (2pt + silver),
	)[
		#strong("系" + thetheoremcounter + ": " + title)\
		#v(-0.3em)
		#it
	]
}

#let remark(title: none, it) = {
	block(
		inset: 10pt,
		width: 100%,
		stroke: (left: 2pt + black),
	)[
		#strong("註" + thetheoremcounter + ": " + title)\
		#v(-0.3em)
		#it
	]
}

#let example(title: none, it) = {
	block(
		inset: 10pt,
		width: 100%,
		stroke: (left: 2pt + gray),
	)[
		#strong("例" + thetheoremcounter + ":" + title)\
		#v(-0.3em)
		#it
	]
}

#let proof(title: none, it) = {
	strong("証明: " + title)
	it
	align(right)[□]
}

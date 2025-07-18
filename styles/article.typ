#let putabstract(it) = [
	#figure(
		kind: "abstract",
		supplement: "Abstract",
	)[
		#block(
			inset: 15pt,
			width: 100%,
		)[
			#align(center)[
				*Abstract*
			]
			#align(left)[
				#it
			]
		]
	]
]

#let putkeywords(it) = [
	#align(left)[
		*Keywords:* #it
	]
]

#let theorem(title: none, id: none, it) = [
	#figure(
		kind: "theorem",
		supplement: "Theorem",
	)[
		#block(
			inset: 0pt,
			width: 100%,
		)[
			#align(left)[
				*Theorem *
				*#context counter(figure.where(kind: "theorem")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#text(style: "oblique")[#it]
			]
		]
	]
	#if id != none { label(id)}
]

#let lemma(title: none, id: none, it) = [
	#figure(
		kind: "theorem",
		supplement: "Lemma",
	)[
		#block(
			width: 100%,
		)[
			#align(left)[
				*Lemma *
				*#context counter(figure.where(kind: "theorem")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let proposition(title: none, id: none, it) = [
	#figure(
		kind: "theorem",
		supplement: "Proposition",
	)[
		#block(
			width: 100%,
		)[
			#align(left)[
				*Proposition *
				*#context counter(figure.where(kind: "theorem")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let corollary(title: none, id: none, it) = [
	#figure(
		kind: "theorem",
		supplement: "Corollary",
	)[
		#block(
			width: 100%,
		)[
			#align(left)[
				*Corollary *
				*#context counter(figure.where(kind: "theorem")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let definition(title: none, id: none, it) = [
	#figure(
		kind: "theorem",
		supplement: "Definition",
	)[
		#block(
			width: 100%,
		)[
			#align(left)[
				*Definition *
				*#context counter(figure.where(kind: "theorem")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let remark(title: none, id: none, it) = [
	#figure(
		kind: "theorem",
		supplement: "Remark",
	)[
		#block(
			width: 100%,
		)[
			#align(left)[
				*Remark *
				*#context counter(figure.where(kind: "theorem")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let example(title: none, id: none, it) = [
	#figure(
		kind: "theorem",
		supplement: "Example",
	)[
		#block(
			inset: 12pt,
			width: 100%,
		)[
			#align(left)[
				*Example *
				*#context counter(figure.where(kind: "theorem")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let proof(title: none, id: none, it) = [
	#pad(
		x: 5pt,
	)[
		*Proof*
		#if title != none [* : #title *]
		#h(.5em)
		#it
		#v(-1em)
		#align(right)[□]
		#if id != none { label(id)}
	]
]

#let article(
	title: none,
	author: none,
	affiliation: none,
	email: none,
	date: none,
	abstract: none,
	keywords: none,
	doc,
) = {
	set page(
		margin: 25mm,
		paper: "a4",
	)
	set text(
		size: 10pt,
		font: "Times New Roman",
	)
	set heading(numbering: "1.")

	// level 1ヘッダーの更新時のみ変更
	show heading.where(level: 1): it => {
		counter(math.equation).update(0)
		counter(figure.where(kind: image)).update(0)
		counter(figure.where(kind: table)).update(0)
		counter(figure.where(kind: raw)).update(0)
		it
	}

	set math.equation(
		numbering: num =>
			numbering("(1.1)", counter(heading).get().first(), num),
			number-align: bottom
	)
	set figure(
		numbering: num =>
			numbering("1.1", counter(heading).get().first(), num)
	)
	show math.equation: it => {
		if it.block and not it.has("label") [
			#counter(math.equation).update(v => v - 1)
			#math.equation(it.body, block: true, numbering: none)#label("")
		] else {
		it
		}
	}

	// title
	if title != none {
		align(center)[
			#text(size: 16pt, weight: "bold")[#title]
		]
		v(1em)
	}

	// title
	if author != none {
		align(center)[
			#text(size: 12pt, weight: "bold")[#author]
		]
	}
	if affiliation != none {
		align(center)[
			#text(size: 10pt)[#affiliation]
		]
	}
	if email != none {
		align(center)[
			#text(size: 10pt)[#email]
		]
	}
	if date != none {
		align(center)[
			#text(size: 10pt)[#date]
		]
	}

	if abstract != none {
		putabstract(abstract)
	}

	if keywords != none {
		putkeywords(keywords)
		v(1em)
	}

	// 本文
	doc
} 
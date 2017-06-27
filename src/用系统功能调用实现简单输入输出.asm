.data
	A: .asciiz "Alpha"	
	BB: .asciiz "Bravo"
	C: .asciiz "China"
	D: .asciiz "Delta"
	E: .asciiz "Echo"
	F: .asciiz "Foxtrot"
	G: .asciiz "Golf"	
	H: .asciiz "Hotel"
	I: .asciiz "India"
	JJ: .asciiz "Juliet"
	K: .asciiz "Kilo"
	L: .asciiz "Lima"
	M: .asciiz "Mary"	
	N: .asciiz "November"
	O: .asciiz "Oscar"
	P: .asciiz "Paper"
	Q: .asciiz "Quebec"
	R: .asciiz "Research"
	S: .asciiz "Sierra"	
	T: .asciiz "Tango"
	U: .asciiz "Uniform"
	V: .asciiz "Victor"
	W: .asciiz "Whisky"
	X: .asciiz "X-ray"	
	Y: .asciiz "Yankee"	
	Z: .asciiz "Zulu"
	N1: .asciiz "First"
	N2: .asciiz "Second"
	N3: .asciiz "Third"
	N4: .asciiz "Fourth"
	N5: .asciiz "Fifth"
	N6: .asciiz "Sixth"
	N7: .asciiz "Seventh"
	N8: .asciiz "Eighth"
	N9: .asciiz "Ninth"
	N0: .asciiz "zero"
	a: .asciiz "alpha"	
	bb: .asciiz "bravo"
	c: .asciiz "china"
	d: .asciiz "delta"
	e: .asciiz "echo"
	f: .asciiz "foxtrot"
	g: .asciiz "golf"	
	h: .asciiz "hotel"
	i: .asciiz "india"
	jj: .asciiz "juliet"
	k: .asciiz "kilo"
	l: .asciiz "lima"
	m: .asciiz "mary"	
	n: .asciiz "november"
	o: .asciiz "oscar"
	p: .asciiz "paper"
	q: .asciiz "quebec"
	r: .asciiz "research"
	s: .asciiz "sierra"	
	t: .asciiz "tango"
	u: .asciiz "uniform"
	v: .asciiz "victor"
	w: .asciiz "whisky"
	x: .asciiz "x-ray"	
	y: .asciiz "yankee"	
	z: .asciiz "zulu"
	map: .word a, bb, c, d, e, f, g, h, i, jj, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, A, BB, C, D, E, F, G, H, I, JJ, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, N0, N1, N2, N3, N4, N5, N6, N7, N8, N9
	enter: .asciiz "\r\n"
	pre: .asciiz "\b"
	stat: .asciiz "*"
.text
main:
#获取输入并判断
getInput:	
	li $v0, 12
	syscall		
	beq $v0, '?', exit
	bgt $v0, 'z', outputSymbol
	bge $v0, 'a', outputalpha
	bgt $v0, 'Z', outputSymbol
	bge $v0, 'A', outputAlpha
	bgt $v0, '9', outputSymbol
	bge $v0, '0', outputNumber
	j outputSymbol
	
#输出alpha
outputalpha:
	sub $v0, $v0, 'a'
	j outputMap
	
#输出Alpha
outputAlpha:	
	sub $v0, $v0, 'A'
	add $v0, $v0, 26
	j outputMap
	
#输出number
outputNumber:
	sub $v0, $v0, '0'
	add $v0, $v0, 52
	j outputMap

#输出map
outputMap:
	sll $v0, $v0, 2
	la $t0, map
	add $t0, $t0, $v0
	
	li $v0, 4
	la $a0, pre
	syscall
	
	li $v0, 4
	lw $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, enter
	syscall
	
	j getInput
	
#输出*
outputSymbol:
	li $v0, 4
	la $a0, pre
	syscall
	
	li $v0, 4
	la $a0, stat
	syscall
	
	li $v0, 4
	la $a0, enter
	syscall
	
	j getInput
	
#结束,输入？
exit:
	li $v0, 10
	syscall

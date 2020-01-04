#!/usr/bin/env nextflow

//Script parameters
params.str = 'hello world'


f = Channel.from("hello", "world")



process pyth {
	//conda 'cruk'

    input:
		val STR from 'hello one', 'world one'

	output:
		stdout outp1
	
	script:
		template 'print.py'

}

process inp1 {
	input:
		val x from f

	output:
		stdout inp2py

	"""
	echo $x
	"""
}

process pyth2 {
	input:
		stdin inp2py

	output:
		stdout outp2

	'''
	#!/usr/bin/env python
	import sys

	for word in sys.stdin:
		print(f"MyString is still a string of {word}") 
	'''
}

outp1.view {
	it.trim() // Current iteration implicit variable trimmed to remove newline
}

outp2.view {
	it.trim()
}

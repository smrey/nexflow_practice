#!/usr/bin/env nextflow

//Script parameters

//params.fl = "/path/to/file/"
//f = Channel.fromPath(params.fl)



process pyth {
	conda 'cruk'

    input:
		val STR from 'hello', 'world'
	
	script:
		template 'print.py'

}

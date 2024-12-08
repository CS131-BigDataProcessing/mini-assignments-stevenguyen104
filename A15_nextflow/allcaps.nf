#!/usr/bin/env nextflow

workflow {
    ConvertToUpper()
}

process ConvertToUpper {
    input:
    val inString from params.in_string

    output:
    path "output.txt"

    script:
    """
    echo "$inString" | tr '[:lower:]' '[:upper:]' > output.txt
    """
}
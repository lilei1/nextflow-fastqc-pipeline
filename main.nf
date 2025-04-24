#!/usr/bin/env nextflow

// Define input parameters
params.reads = "test-data/*.fastq"
params.outdir = "results"

// Log parameters
log.info """\
         F A S T Q C   P I P E L I N E
         ===========================
         reads        : ${params.reads}
         outdir       : ${params.outdir}
         """
         .stripIndent()

// Import the FASTQC process
include { FASTQC } from './modules/fastqc'

// Define the workflow
workflow {
    // Create a channel for input reads
    Channel.fromPath(params.reads)
           .map { file -> tuple(file.simpleName, file) }
           .set { read_files_ch }
    
    // Run FastQC
    FASTQC(read_files_ch)
    
    // Collect and display results
    FASTQC.out.html_report.view { "FastQC report generated: $it" }
}
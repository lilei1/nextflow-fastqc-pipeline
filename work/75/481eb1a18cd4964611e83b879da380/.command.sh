#!/bin/bash -ue
# Run FastQC
fastqc --outdir ./            --threads 1            --format fastq            sample1.fastq

# Rename output to include sample ID
mv sample1_fastqc.html sample1_fastqc.html
mv sample1_fastqc.zip sample1_fastqc.zip

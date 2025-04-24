# Nextflow FastQC Pipeline

[![Nextflow FastQC Pipeline CI](https://github.com/yourusername/nextflow-fastqc-pipeline/actions/workflows/ci.yml/badge.svg)](https://github.com/yourusername/nextflow-fastqc-pipeline/actions/workflows/ci.yml)

A simple Nextflow pipeline that takes FASTQ inputs, runs FastQC, and emits HTML reports.

## Requirements

- Nextflow (>=21.10.0)
- Docker or Singularity

## Usage

```bash
# Run with default parameters
nextflow run main.nf -profile docker

# Specify custom input files
nextflow run main.nf -profile docker --reads "path/to/your/*.fastq"

# Specify custom output directory
nextflow run main.nf -profile docker --outdir "my-results"
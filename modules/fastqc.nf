process FASTQC {
    tag "FastQC on ${sample_id}"
    
    container 'quay.io/biocontainers/fastqc:0.11.9--0'
    
    publishDir "results/fastqc", mode: 'copy'
    
    input:
    tuple val(sample_id), path(reads)
    
    output:
    path "${sample_id}_fastqc.html", emit: html_report
    path "${sample_id}_fastqc.zip", emit: zip_report
    
    script:
    """
    # Run FastQC
    fastqc --outdir ./ \
           --threads ${task.cpus} \
           --format fastq \
           ${reads}
    
    # Rename output to include sample ID
    mv ${reads.simpleName}_fastqc.html ${sample_id}_fastqc.html
    mv ${reads.simpleName}_fastqc.zip ${sample_id}_fastqc.zip
    """
}
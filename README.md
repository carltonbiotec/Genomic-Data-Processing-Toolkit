# Genomic-Data-Processing-Toolkit
Genomic Data Processing Toolkit

This repository contains a collection of Bash scripts designed to streamline various steps in genomic data processing, from alignment and trimming to conversion and deduplication of sequencing data. These tools are intended for researchers and bioinformaticians dealing with genomic datasets.

Scripts Included
1. HISAT2 Alignment (hisat.sh)
Automates the alignment of trimmed FASTQ files using HISAT2, specifically designed for paired-end data alignment against a mitochondrial genome.

2. SAM to BAM Conversion (samtobam.sh)
Converts SAM files to sorted BAM files using Samtools, suitable for batch processing of multiple files.

3. FASTQ Trimming (trimmomatic.sh)
Utilizes Trimmomatic to trim raw FASTQ files, removing adapters and low-quality sequences from paired-end reads.

4. Duplicate Marking (Picard.sh)
Uses Picard tools to mark duplicates in sorted BAM files, with optional support for creating index files for deduplicated BAMs.

5. Collecting WGS Metrics (CollectWgsMetrics.sh)
Employs Picard tools to collect whole genome sequencing metrics from sorted and indexed BAM files.

Dependencies
HISAT2
Samtools
Trimmomatic
Picard

Ensure these tools are installed and accessible in your system's PATH.

#!/bin/bash

# Directory where the trimmed FASTQ files are located
TRIMMED_DIR="/the/folder/"

# Directory to save the SAM output files
SAM_DIR="/the/folder/"

# Path to the HISAT2 mitochondrial genome index
INDEX=""/the/folder/mito_index"

# Number of threads to use
THREADS=8

# Create the SAM directory if it doesn't exist
mkdir -p ${SAM_DIR}

# Loop through each pair of trimmed FASTQ files
for R1 in ${TRIMMED_DIR}*R1_paired.fastq.gz; do
    # Corresponding R2 file
    R2="${R1/R1_paired/R2_paired}"
    
    # Output SAM file name
    SAM="${SAM_DIR}$(basename ${R1/R1_paired/aligned}).sam"

    # Run HISAT2
    hisat2 -p ${THREADS} -x ${INDEX} -1 ${R1} -2 ${R2} -S ${SAM}

    echo "Alignment of ${R1} and ${R2} complete."
done

echo "All samples have been aligned."

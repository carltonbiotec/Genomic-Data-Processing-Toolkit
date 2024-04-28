#!/bin/bash

# Directory where the raw FASTQ files are located
RAW_DIR="/the/folder/"

# Directory where you want to save the trimmed FASTQ files
TRIMMED_DIR="/the/folder/"

# Path to the TruSeq adapter file
ADAPTERS=""/the/folder/TruSeq3-PE.fa"

# Number of threads to use
THREADS=8

# Create the trimmed directory if it doesn't exist
mkdir -p ${TRIMMED_DIR}

# Loop through each pair of raw FASTQ files
for R1 in ${RAW_DIR}*R1*.fastq.gz; do
    # Corresponding R2 file
    R2="${R1/R1/R2}"
    
    # Output file names
    R1_PAIRED="${TRIMMED_DIR}$(basename "${R1}" _raw.fastq.gz)_paired.fastq.gz"
    R1_UNPAIRED="${TRIMMED_DIR}$(basename "${R1}" _raw.fastq.gz)_unpaired.fastq.gz"
    R2_PAIRED="${TRIMMED_DIR}$(basename "${R2}" _raw.fastq.gz)_paired.fastq.gz"
    R2_UNPAIRED="${TRIMMED_DIR}$(basename "${R2}" _raw.fastq.gz)_unpaired.fastq.gz"

    # Run Trimmomatic
    trimmomatic PE -phred33 -threads ${THREADS} \
    "${R1}" "${R2}" \
    "${R1_PAIRED}" "${R1_UNPAIRED}" \
    "${R2_PAIRED}" "${R2_UNPAIRED}" \
    ILLUMINACLIP:${ADAPTERS}:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

    echo "Trimming of ${R1} and ${R2} complete."
done

echo "All files processed."

#!/bin/bash

# Directory where sorted BAM files are located
BAM_DIR="/the/folder/"

# Directory where deduplicated BAM files will be saved
DEDUP_DIR="/the/folder/"

# Directory where metrics files will be saved
METRICS_DIR="/the/folder/"

# Create directories if they don't exist
mkdir -p ${DEDUP_DIR}
mkdir -p ${METRICS_DIR}

# Path to the Picard Jar
PICARD_JAR="/mnt/c/Users/carlt/OneDrive/Documents/GLDS_615/picard.jar"

# Loop through each BAM file in the BAM_DIR
for BAM_FILE in ${BAM_DIR}*_sorted.bam; do
    # Extract the base name for the file (without the _sorted.bam extension)
    BASE_NAME=$(basename ${BAM_FILE} _sorted.bam)
    
    # Picard MarkDuplicates
    java -jar ${PICARD_JAR} MarkDuplicates \
    I=${BAM_FILE} \
    O=${DEDUP_DIR}${BASE_NAME}_dedup.bam \
    M=${METRICS_DIR}${BASE_NAME}_metrics.txt \
    REMOVE_DUPLICATES=true

    # If REMOVE_DUPLICATES is set to false, the line below is required to create the index file
    samtools index ${DEDUP_DIR}${BASE_NAME}_dedup.bam

    echo "Marked duplicates for ${BAM_FILE}."
done

echo "All BAM files have been processed for duplicates."

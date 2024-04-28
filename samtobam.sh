#!/bin/bash

# Directory containing SAM files
SAM_DIR="/the/folder/"

# Directory where BAM files will be saved
BAM_DIR="/the/folder/"

# Create BAM directory if it doesn't exist
mkdir -p ${BAM_DIR}

# Load each SAM file and convert it to sorted BAM
for SAM_FILE in ${SAM_DIR}*.sam; do
    # Extract the base name for the file (without the .sam extension)
    BASE_NAME=$(basename ${SAM_FILE} .sam)
    
    # Convert SAM to BAM and sort
    samtools view -@ 8 -bS ${SAM_FILE} | samtools sort -@ 8 -o ${BAM_DIR}${BASE_NAME}_sorted.bam

    echo "Converted and sorted ${SAM_FILE}."
done

echo "All SAM files have been processed."

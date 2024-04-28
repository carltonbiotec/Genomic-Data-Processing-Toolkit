#!/bin/bash

# Directory where sorted and indexed BAM files are located
BAM_DIR=""/mnt/c/Users/test/wgs_metrics/test/"

# Directory where WGS metrics files will be saved
WGS_METRICS_DIR="/mnt/c/Users/test/wgs_metrics/"

# Path to the reference genome
REFERENCE_GENOME="/mnt/c/Users/NC_012920.1.fna"

# Path to the Picard Jar
PICARD_JAR="/mnt/c/Users/picard.jar"

# Create the WGS metrics directory if it doesn't exist
mkdir -p ${WGS_METRICS_DIR}

# Loop through each BAM file in the BAM_DIR
for BAM_FILE in ${BAM_DIR}*.bam; do
    # Extract the base name for the file (removing path and .bam extension)
    BASE_NAME=$(basename ${BAM_FILE} .bam)
    
    # Run Picard CollectWgsMetrics
    java -jar ${PICARD_JAR} CollectWgsMetrics \
        I=${BAM_FILE} \
        O=${WGS_METRICS_DIR}${BASE_NAME}_wgs_metrics.txt \
        R=${REFERENCE_GENOME} \
        VALIDATION_STRINGENCY=LENIENT

    echo "WGS metrics collected for ${BAM_FILE}."
done

echo "All BAM files have been processed for WGS metrics."

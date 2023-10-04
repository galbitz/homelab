#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <folders_to_backup> <output_directory>" 1>&2
  exit 1
fi

# "/opt/docker/data/list.txt"
FOLDER_LIST_FILE=$1

# "$HOME/backup"
DEST_DIR=$2

# Create a timestamp for the backup folder name (YYYY-MM-DD-HHMMSS)
TIMESTAMP=$(date +"%Y-%m-%d-%H%M%S")

# Create a temporary directory for the compressed backup
TEMP_DIR="/var/tmp/backup"

mkdir -p $DEST_DIR
mkdir -p $TEMP_DIR


# Read the list of folders from the file and backup each one
while IFS= read -r folder; do
    if [ -d "$folder" ]; then
        rsync -av --delete "$folder/" "$TEMP_DIR/$(basename "$folder")-$TIMESTAMP"
    else
        echo "Skipping folder (does not exist): $folder"
    fi
done < "$FOLDER_LIST_FILE"

# Compress the backup using tar with gzip compression
tar -czf "$DEST_DIR/backup-$TIMESTAMP.tar.gz" -C "$TEMP_DIR" .

# Remove the temporary backup directory
rm -rf "$TEMP_DIR"

# Keep a specified number of previous backups (adjust as needed)
NUM_BACKUPS_TO_KEEP=3
cd "$DEST_DIR"
ls -1t | tail -n +$((NUM_BACKUPS_TO_KEEP + 1)) | xargs -I {} rm {}


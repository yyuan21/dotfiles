#!/usr/bin/env bash

#################### include variables uuuuuuuuuuuuuuuuuuuu

source config.sh

#################### restore files in backup folder ####################

if [ ! -d $DOT_BACKUP ]; then
    printf "${RED}Backup files not found${NORMAL}\n"
    exit 1
fi

# all the backed up files
BACKUP_FILES=$(find "$DOT_BACKUP" ! -path "$DOT_BACKUP" -maxdepth 1)

for bf in $BACKUP_FILES; do
    echo $bf
done

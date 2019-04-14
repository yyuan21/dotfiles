#!/usr/bin/env bash

#################### include variables uuuuuuuuuuuuuuuuuuuu

source config.sh

#################### clean up symbolic links ####################

if [ ! -f $SYMB_FILES ]; then
    printf "${RED}Symbolic links backup files not found${NORMAL}\n"
    exit 1
fi

printf "${YELLOW}Clean up all symbolic links:${NORMAL}\n"
while IFS= read -r line
do
    printf "Removing symbolic link: ${GREEN}%s${NORMAL}\n" "$line"
    rm $line
done < "$SYMB_FILES"

rm -rf $TEMP_FOLDER
printf "${YELLOW}All symbolic links removed${NORMAL}\n"

echo ""

#################### restore files in backup folder ####################

if [ ! -d $DOT_BACKUP ]; then
    printf "${RED}Backup files not found${NORMAL}\n"
    exit 1
fi

printf "${YELLOW}Restore back up files:${NORMAL}\n"
# all the backed up files
BACKUP_FILES=$(find "$DOT_BACKUP" -maxdepth 1 ! -path "$DOT_BACKUP")

for bf in $BACKUP_FILES; do
    homefile=~/$(basename $bf)
    printf "Moving ${GREEN}%s${NORMAL} back to ${GREEN}%s${NORMAL}\n" "$bf" "$homefile"
    mv $bf $homefile
done
rm -rf $DOT_BACKUP
printf "${YELLOW}All back up files restored to home directory${NORMAL}\n"

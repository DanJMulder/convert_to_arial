#!/bin/bash

# set the date by prompting the user
echo "Input the date of the clinic (YYYY-MM-DD):"
read DATE
echo "Converting font to arial for all files..."

# copy the unconverted (original) .docx files into a new "unconverted" folder in OneDrive (for safekeeping)
mkdir /Clinic\ Notes/$DATE/unconverted
cp -R /Clinic\ Notes/$DATE/AM /Clinic\ Notes/$DATE/unconverted/AM
cp -R /Clinic\ Notes/$DATE/PM /Clinic\ Notes/$DATE/unconverted/PM

# make a working folder to keep later in case something goes wrong (originals in OneDrive will be overwritten)
mkdir ~/Downloads/working

# copy files to convert them in the Downloads folder (doesn't work directly in OneDrive because of access issues/offline storage)
cp -R /Clinic\ Notes/$DATE/  ~/Downloads/working

# convert the docx to txt file then convert back to docx while simultaneously converting font to arial
textutil -convert txt /Users/danielmulder/Downloads/working/AM/*.docx
textutil -convert docx -font Arial /Users/danielmulder/Downloads/working/AM/*.txt
textutil -convert txt /Users/danielmulder/Downloads/working/PM/*.docx
textutil -convert docx -font Arial /Users/danielmulder/Downloads/working/PM/*.txt

# remove the intermediate .txt files
rm /Users/danielmulder/Downloads/working/AM/*.txt
rm /Users/danielmulder/Downloads/working/PM/*.txt

# copy the newly converted .docx files back into onedrive (this overwrites the originals)
cp -R /Clinic\ Notes/$DATE/
cp -R /Clinic\ Notes/$DATE/

# remove the intermediate folder in the Downloads folder
rm -r /Users/danielmulder/Downloads/working/

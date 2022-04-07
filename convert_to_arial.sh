#!/bin/bash

# set the date each time
DATE=2022-04-**

# work to convert files in the Downloads folder
mkdir ~/Downloads/converted
cp -R /Users/danielmulder/OneDrive\ -\ Kingston\ Health\ Sciences\ Centre/Clinical/Clinic\ Notes/$DATE/  ~/Downloads/converted

# convert the docx to txt file then convert back to docx while simultaneously converting font to arial
textutil -convert txt /Users/danielmulder/Downloads/converted/AM/*.docx
textutil -convert docx -font Arial /Users/danielmulder/Downloads/converted/AM/*.txt
textutil -convert txt /Users/danielmulder/Downloads/converted/PM/*.docx
textutil -convert docx -font Arial /Users/danielmulder/Downloads/converted/PM/*.txt

# remove the intermediate .txt files
rm /Users/danielmulder/Downloads/converted/AM/*.txt
rm /Users/danielmulder/Downloads/converted/PM/*.txt

# copy the newly converted .docx files back into onedrive
cp -R /Users/danielmulder/Downloads/converted /Users/danielmulder/OneDrive\ -\ Kingston\ Health\ Sciences\ Centre/Clinical/Clinic\ Notes/$DATE/

# remove the intermediate folder in the Downloads folder
rm -r /Users/danielmulder/Downloads/converted/

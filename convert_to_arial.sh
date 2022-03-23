#!/bin/bash

mkdir ~/Downloads/converted
cp -R Clinic\ Notes/  ~/Downloads/converted
textutil -convert txt /Downloads/converted/AM/*.docx
textutil -convert docx -font Arial /Downloads/converted/AM/*.txt
textutil -convert txt /Downloads/converted/PM/*.docx
textutil -convert docx -font Arial /Downloads/converted/PM/*.txt
rm /Downloads/converted/AM/*.txt
rm /converted/PM/*.txt
cp -R /Downloads/converted /Clinical/Clinic\ Notes/

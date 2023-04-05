@echo off
set /p variable=" FileName of TXT File? " 
perl GetFileNames_T.pl > %variable%.txt
mpv -ontop -playlist  %variable%.txt

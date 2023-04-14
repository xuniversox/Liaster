@echo off
set /p variable=" FileName of M3U File? " 
perl GetFileNames_M.pl > %variable%.m3u8
mpv -ontop -playlist  %variable%.m3u8

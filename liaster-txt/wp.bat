ruby GetFileNamesTXT.rb
@echo off
set /p variable=" FileName of TextFile? " 
ruby GetFileNames.rb > %variable%.txt
mpv -ontop -playlist  %variable%.txt
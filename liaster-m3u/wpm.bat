ruby GetFileNamesM3U.rb
@echo off
set /p variable=" FileName of TextFile? " 

ruby GetFileNamesM3U.rb > %variable%.m3u

mpv -ontop -playlist  %variable%.m3u
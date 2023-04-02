ruby GetFileNamesM3U.rb
@echo off
set /p variable=" FileName of TextFile? " 
ruby GetFileNames.rb > %variable%.m3u
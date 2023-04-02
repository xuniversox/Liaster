ruby GetFileNamesTXT.rb
@echo off
set /p variable=" FileName of TextFile? " 
ruby GetFileNamesTXT.rb > %variable%.txt
setlocal EnableDelayedExpansion

for /f "delims=" %%a in ('wpt.bat ^| findstr /v /c:"%variable%.txt" "wpm"') do (
  set "line=%%a"
  
)
cls
echo !line!
mpv -ontop -playlist  %variable%.txt

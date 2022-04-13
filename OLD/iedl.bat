::@echo off
:: Old batch for using Internet Explorer to download a file. Replaced with CURL in the "get IP demo".
set /p fndst=type "^|findstr" without quotes: 
setlocal enableextensions 
echo http://[URL]/[file] - do not include http or slash 
set /p url=Server or URL: 
set /p file=FILE on server: 
set /p outfile=What do you want the downloaded file called? 
set ext=%file:~-3%
set fname=%file:~0,-4%
start /min iexplore.exe http://%url%/%file%
for /f "tokens=*" %%a in ('tasklist %fndst% /i /r iexplore') do (set !ie=%%a) 
set !ied=%!ie:~28,4%
cd \
echo Give it a second or it doesnt find the file..Press [Enter]
pause
for /f "tokens=*" %%a in ('dir /a:s /s /a %fname%*.%ext% %fndst% /i /r Content.ie') do (set !lc=%%a) 
set !loc=%!lc:~13,255%
cd %!loc%
for /f "tokens=*" %%c in ('dir %fname%*.%ext% %fndst% /i /r %fname%') do (set !tname=%%c) 
set !tnm=%!tname:~39,20%
taskkill /pid %!ied%
move %!tnm% \%outfile%
cd \
dir %outfile%
del /q *.0
endlocal

@echo off
cls
echo *******************
echo * Copier fichiers *
echo *******************

:codePostal
set codeCommune=0
echo Entrez le code de la commune ?
set /p codeCommune=
if %codeCommune% GTR 99999 goto codePostal
if %codeCommune% LEQ 0 goto codePostal

rem dir /A:D /B "Z*C %code_commune%*" > test.dat

for /F "tokens=1-2" %%a in ('dir /A:D /B "Z*C %codeCommune%*"') do (
	echo Repertoire : %%a %%b
	call :extraire %%a %%b 
)

call CompterFiles.bat %codeCommune%

pause
goto fin

:extraire
echo Fonction Extraire
set repertoire=%1 %2

echo Commune %codeCommune%

set type=%repertoire:~9,1%
if "%type%"=="_" echo ZNC
if "%type%"=="-" echo ZMC

set anomalie=%repertoire:~10,5%
echo Anomalie : %anomalie%

move /Y "%codeCommune%-%anomalie%*.pdf" "./%repertoire%"
move /Y "%codeCommune%-%anomalie%*.dgn" "./%repertoire%"
:fin

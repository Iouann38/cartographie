@echo off
cls
echo ********************
echo * Compter fichiers *
echo ********************

:codePostal

if "%1" == "" (
set codeCommune=0
set /p codeCommune=Entrez le code de la commune ?
) else (
set /a codeCommune=%1
)

if %codeCommune% GTR 99999 goto codePostal
if %codeCommune% LEQ 0 goto codePostal

set nbFichiersAttendus=0
set /p nbFichiersAttendus=Entrez le nombre de fichiers attendus ?

rem dir /A:D /B "Z*C %code_commune%*" > test.dat
set /a nbFichManquants=0

for /F "tokens=1-2" %%a in ('dir /A:D /B "Z*C %codeCommune%*"') do (
	rem echo Repertoire : %%a %%b
	call :compte %%a %%b %nbFichiersAttendus% nbFichManquants
)

IF %nbFichManquants% EQU 0 (
	echo Tous les fichiers sont presents
) ELSE (
	echo Il manque %nbFichManquants% fichiers
)

goto fin

:compte
rem echo Fonction Compte
set repertoire=%1 %2
set nbFichiersAttendus=%3

set /a nbFichiers=0
for /f "delims=" %%i in ('dir "%repertoire%" /A-D /A-H /B /S ^| find "." /C') do set /a nbFichiers=%%i

if %nbFichiers% NEQ %nbFichiersAttendus% (
	echo *** Erreur : Dans %repertoire%, il y a %nbFichiers% fichiers au lieu de %nbFichiersAttendus% attendus. ***
	
	set /a %~4=%4 + %nbFichiersAttendus% - %nbFichiers%
)
goto:eof

:fin
pause

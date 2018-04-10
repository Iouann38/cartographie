@echo off

:reload
cls

for /F "tokens=1 delims=, " %%i In ('powershell date') do set WD=%%i
echo Aujourd'hui, nous sommes %WD%

echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Batch Diagnostics      ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 1 - Creer repertoires  ³
echo ³ 2 - Copier fichiers    ³
echo ³ 3 - Compter fichiers   ³
echo ³ 4 - Quitter            ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

choice /c 1234 /t 10 /d 4

if errorlevel 4 (
pause
) else (
if errorlevel 3 (
call CompterFiles.bat
) else (
if errorlevel 2 (
call CopierFiles.bat
) else (
if errorlevel 1 call CreerDirectories.bat
)
)
goto reload
)

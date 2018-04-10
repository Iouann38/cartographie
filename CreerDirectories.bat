@echo off
cls
echo *********************
echo * Creer repertoires *
echo *********************

echo Entrez le code de la commune ?
set /p code_commune=
echo Commune %code_commune%

:debut
echo Entrez l'indice de debut des anomalies ?
set /p debut_anomalie= 

if %debut_anomalie% LSS 1 goto debut
set /a indice=%debut_anomalie%-1

:fin
echo Entrez l'indice de fin des anomalies ?
set /p fin_anomalie= 

if %fin_anomalie% GTR 99999 goto fin

echo Anomalie de %debut_anomalie% a %fin_anomalie%

:boucle
set /a indice=%indice%+1

:zone
echo Anomalie %indice% : ZNC (1) ou ZMC (2) ou Skip (s ou 3) ?
set /p test=
if %test% EQU s goto condition
if %test% EQU S goto condition
if %test% EQU 3 goto condition
if %test% LSS 1 goto zone
if %test% GTR 2 goto zone

if %test% == 1 set type_anomalie=ZNC
if %test% == 2 set type_anomalie=ZMC
echo Anomalie type : %type_anomalie%

if %indice% LSS 10 (
	set format=0000%indice% 
) else if %indice% LSS 100 (
	set format=000%indice%
) else if %indice% LSS 1000 (
	set format=00%indice%
) else if %indice% LSS 10000 (
	set format=0%indice%
) else if %indice% LSS 100000 (
	set format=%indice%
)

:repertoire
echo Creation repertoire : %type_anomalie% %code_commune%-%format%
if %test% == 1 mkdir "%type_anomalie% %code_commune%_%format%"
if %test% == 2 mkdir "%type_anomalie% %code_commune%-%format%"

:condition
if %indice% GEQ %fin_anomalie% goto quitter
if %indice% LSS %fin_anomalie% goto boucle

:quitter
pause


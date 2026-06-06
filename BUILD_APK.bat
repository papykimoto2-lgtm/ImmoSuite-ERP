@echo off
REM ============================================================
REM  ImmoSuite ERP - Generation APK Android (Capacitor)
REM  Pre-requis : Node.js + Android Studio (SDK installe)
REM ============================================================
setlocal
title ImmoSuite - Build APK

echo.
echo ============================================
echo   IMMOSUITE ERP - BUILD APK ANDROID
echo ============================================
echo.

REM --- 1. Verifier Node ---
where node >nul 2>nul
if errorlevel 1 (
  echo [ERREUR] Node.js introuvable. Installez-le : https://nodejs.org
  pause & exit /b 1
)

REM --- 2. Installer les dependances ---
echo [1/5] Installation des dependances npm...
call npm install
if errorlevel 1 ( echo [ERREUR] npm install a echoue. & pause & exit /b 1 )

REM --- 3. Initialiser Capacitor si besoin ---
if not exist "android" (
  echo [2/5] Ajout de la plateforme Android...
  call npx cap add android
) else (
  echo [2/5] Plateforme Android deja presente - OK
)

REM --- 4. Synchroniser le code web dans le projet natif ---
echo [3/5] Synchronisation des fichiers web...
call npx cap sync android
if errorlevel 1 ( echo [ERREUR] cap sync a echoue. & pause & exit /b 1 )

REM --- 5. Compiler l'APK de debug ---
echo [4/5] Compilation de l'APK (debug)...
cd android
call gradlew.bat assembleDebug
if errorlevel 1 ( echo [ERREUR] La compilation Gradle a echoue. & cd .. & pause & exit /b 1 )
cd ..

REM --- 6. Resultat ---
echo.
echo [5/5] TERMINE !
echo APK genere dans :
echo   android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo Copiez ce fichier sur le telephone Android et installez-le
echo (autorisez "Sources inconnues" dans les parametres).
echo.
pause

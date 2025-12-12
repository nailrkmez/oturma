@echo off
REM ========================================
REM AETHER-X Clean Build Script
REM ========================================

echo.
echo ╔════════════════════════════════════════╗
echo ║   AETHER-X APK Build Automation      ║
echo ╚════════════════════════════════════════╝
echo.

REM Step 1: Fix Pub Cache Dependencies
echo [1/6] Fixing Android namespaces...
powershell -ExecutionPolicy Bypass -File fix_dependencies.ps1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Namespace fix failed
    exit /b 1
)

REM Step 2: Clean old builds
echo [2/6] Cleaning build cache...
call flutter clean

REM Step 3: Get dependencies
echo [3/6] Installing dependencies...
call flutter pub get

REM Step 4: Generate Isar files
echo [4/6] Generating Isar models...
call flutter pub run build_runner build --delete-conflicting-outputs
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Build runner failed
    exit /b 1
)

REM Step 5: Fix Web integers
echo [5/6] Fixing Web compatibility...
call dart tool/fix_web_build.dart

REM Step 6: Build APK
echo [6/6] Building APK...
call flutter build apk --release --no-tree-shake-icons

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Build successful!
    echo 📦 APK Location: build\app\outputs\flutter-apk\app-release.apk
    echo.
    
    REM Copy to apk folder
    if not exist "apk" mkdir apk
    copy /Y build\app\outputs\flutter-apk\app-release.apk apk\aether-x.apk
    echo.
    echo ✅ APK copied to: apk\aether-x.apk
) else (
    echo.
    echo ❌ Build failed! Check logs above.
)

pause

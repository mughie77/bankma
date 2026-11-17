@echo off
setlocal
cd /d "%~dp0"
title Instalasi Microsoft Visual C++ Redistributable (x64)

echo ==============================================================
echo   PEMASANGAN DEPENDENSI SISTEM CF BANK MANUK AYU
echo ==============================================================
echo.
echo Memeriksa status Visual C++ Redistributable (x64)...

if exist "%SystemRoot%\System32\vcruntime140.dll" (
    echo [OK] vcruntime140.dll sudah terpasang di sistem.
) else (
    echo [!] vcruntime140.dll belum terpasang di C:\Windows\System32.
    echo Memulai pemasangan otomatis vc_redist.x64.exe...
    if exist "vc_redist.x64.exe" (
        start /wait "" "vc_redist.x64.exe" /install /passive /norestart
    ) else (
        echo Mengunduh installer dari Microsoft...
        powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vc_redist.x64.exe' -OutFile 'vc_redist.x64.exe'"
        start /wait "" "vc_redist.x64.exe" /install /passive /norestart
    )
    echo [OK] Pemasangan selesai.
)

echo.
echo Membuka aplikasi CF BANK MANUK AYU...
start "" "bankma.exe"
exit /b 0

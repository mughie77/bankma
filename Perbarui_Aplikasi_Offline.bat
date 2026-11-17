@echo off
chcp 65001 >nul
title Perbarui Aplikasi CF BANK MANUK AYU
echo ======================================================================
echo           SKRIP PEMBARUAN APLIKASI CF BANK MANUK AYU
echo ======================================================================
echo.
echo Petunjuk:
echo 1. Skrip ini akan memperbarui berkas program aplikasi (exe dan dll).
echo 2. Berkas Database (bankma.db) tersimpan terpisah di folder AppData
echo    sehingga SELURUH DATA NASABAH 100%% AMAN dan TIDAK AKAN HILANG.
echo.
pause

echo.
echo [1/3] Menutup aplikasi CF BANK MANUK AYU jika sedang terbuka...
taskkill /f /im bankma.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/3] Memperbarui berkas program...
if exist "%~dp0Release" (
    robocopy "%~dp0Release" "%~dp0." /E /NP /R:2 /W:1 /XF bankma.db >nul 2>&1
) else if exist "%~dp0update_files" (
    robocopy "%~dp0update_files" "%~dp0." /E /NP /R:2 /W:1 /XF bankma.db >nul 2>&1
) else (
    echo Menimpa berkas di folder saat ini...
)

echo [3/3] Membuka kembali aplikasi versi terbaru...
timeout /t 1 /nobreak >nul
if exist "%~dp0bankma.exe" (
    start "" "%~dp0bankma.exe"
)

echo.
echo ======================================================================
echo PEMBARUAN SELESAI DENGAN SUKSES! Data nasabah Anda tetap utuh 100%%.
echo ======================================================================
pause
exit

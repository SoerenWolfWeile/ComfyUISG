@echo off
setlocal

:: Define variables
set "sevenZipPath=%ProgramFiles%\7-Zip\7z.exe"
set "sevenZipInstaller=7z2201-x64.exe"
set "sevenZipUrl=https://www.7-zip.org/a/7z2201-x64.exe"
set "comfyUrl=https://github.com/comfyanonymous/ComfyUI/releases/latest/download/ComfyUI_windows_portable_nvidia.7z"
set "filename=ComfyUI_windows_portable_nvidia.7z"
set "extract_folder=ComfyUI_portable"

echo /////===============================================================\\\\\
echo Hello! This file will autometicly install ComfyUI on your workstation 
echo with the right models and workflows listed in the file.
echo It will check, if you have 7zip installed and will download the portable version of ComfyUI.
echo The workflows and models where tested on a workstation with 32 GB RAM and a 1080Ti with 11GB.
echo So, everything above that will work great :D
echo Hope you have fun! :)
echo \\\\\===============================================================/////

:: Check if 7-Zip is installed
if not exist "%sevenZipPath%" (
    echo 7-Zip is not installed.
    set /p "installChoice=Do you want to download and install 7-Zip? (y/n): "
    if /i "%installChoice%" neq "y" (
        echo 7-Zip installation is required. Exiting...
        exit /b 1
    )

    :: Download 7-Zip installer
    echo Downloading 7-Zip installer...
    powershell -Command "Invoke-WebRequest -Uri %sevenZipUrl% -OutFile %sevenZipInstaller%"

    :: Check if the installer was downloaded
    if not exist %sevenZipInstaller% (
        echo Failed to download 7-Zip installer.
        exit /b 1
    )

    :: Install 7-Zip silently
    echo Installing 7-Zip...
    start /wait %sevenZipInstaller% /S

    :: Verify installation
    if not exist "%sevenZipPath%" (
        echo 7-Zip installation failed. Exiting...
        exit /b 1
    )
    echo 7-Zip installed successfully.
) else (
    echo 7-Zip is already installed.
)

:: Download ComfyUI portable package
set /p "installChoiceCU=Do you want to download and extract ComfyUI? (y/n): "
    if /i "%installChoiceCU%" neq "y" (
        echo ComnfyUI is required. Exiting...
        exit /b 1
    )
echo Downloading ComfyUI portable package...
powershell -Command "Invoke-WebRequest -Uri %comfyUrl% -OutFile %filename%"

:: Check if the ComfyUI download succeeded
if not exist %filename% (
    echo ComfyUI download failed!
    exit /b 1
)

:: Extract the downloaded file using 7-Zip
echo Extracting %filename%...
if not exist "%extract_folder%" mkdir "%extract_folder%"
"%sevenZipPath%" x %filename% -o"%extract_folder%"

:: Check if extraction succeeded
if %errorlevel% neq 0 (
    echo Extraction failed!
    exit /b 1
)

echo Extraction completed successfully.
exit /b 0
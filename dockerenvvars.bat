@echo off

REM Get the IP address of the container named "java-server" and set it in the environment variable APP_IP
for /f "tokens=*" %%a in ('docker inspect -f "{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}" java-server') do set "APP_IP=%%a"

REM Get the IP address of the container named "selenium-hub" and set it in the environment variable GRID_URL
for /f "tokens=*" %%b in ('docker inspect -f "{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}" selenium-hub') do set "GRID_URL=%%b"

echo APP_IP=%APP_IP%
echo GRID_URL=%GRID_URL%
@echo off
setlocal enabledelayedexpansion

set XSLT=%1

for /f "delims=" %%A in ('more') do (
    echo %%A | xsltproc "%XSLT%" -
)

endlocal

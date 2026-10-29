@echo off
REM Stops any streamlit process
for /f "tokens=2" %%a in ('tasklist /fi "imagename eq streamlit.exe" /nh') do (
    taskkill /f /pid %%a >nul 2>&1
)
echo Stopped streamlit processes (if any).
pause

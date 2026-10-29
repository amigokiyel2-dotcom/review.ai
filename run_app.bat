@echo off
REM Starts the Streamlit app using the project's venv
SET STREAMLIT_EXE="%~dp0.venv\Scripts\streamlit.exe"
cd /d "%~dp0"
%STREAMLIT_EXE% run app.py --server.port 8501
pause

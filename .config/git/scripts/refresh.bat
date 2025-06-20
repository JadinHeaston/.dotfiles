del /f /s /q "%userprofile%\.config\git\" 1>nul
rmdir /s /q "%userprofile%\.config\git\"
mkdir "%userprofile%\.config\git\"
xcopy /s /Y "%~dp0..\" "%userprofile%\.config\git\"
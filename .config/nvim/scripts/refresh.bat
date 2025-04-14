del /f /s /q "%userprofile%\AppData\Local\nvim\" 1>nul
rmdir /s /q "%userprofile%\AppData\Local\nvim\"
mkdir "%userprofile%\AppData\Local\nvim\"
xcopy /s /Y "%~dp0..\" "%userprofile%\AppData\Local\nvim\"
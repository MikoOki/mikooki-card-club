@echo off
REM One-time fix: remove secret files from the last commit so push can succeed.
REM Run this from the MikoOki project root, or cd to web_export first.
cd /d "%~dp0"

echo Removing secrets from git tracking...
git rm --cached --ignore-unmatch "modules/receipt_printer/printer_config.json" 2>nul
git rm --cached --ignore-unmatch "modules/receipt_printer/print_history.json" 2>nul
git add .gitignore
git add -u
echo Amending the last commit to drop secret files...
git commit --amend --no-edit
echo.
echo Now push with:   git push
echo Or run your app and use TCG sync again to push.
git push
pause

@echo off
@REM Needs Flutter 3.27 -- the last verison of Flutter to have the HTML renderer
flutter27 build web --web-renderer html && firebase deploy --only hosting

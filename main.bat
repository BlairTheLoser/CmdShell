@echo off
title CMDShell
setlocal EnableDelayedExpansion

:startup
cls
echo ==============================
echo        CMDShell v1.0
echo ==============================
echo Type "help" for commands.
echo.

:loop
set /p input=cmdshell$^> 

if "%input%"=="" goto loop

for /f "tokens=1,*" %%A in ("%input%") do (
    set cmd=%%A
    set args=%%B
)


if /i "%cmd%"=="exit" goto exit


if /i "%cmd%"=="help" (
    echo.
    echo Built-in Commands:
    echo  help           Show this menu
    echo  exit           Exit CMDShell
    echo  clear          Clear screen
    echo  pwd            Show current directory
    echo  cd [path]      Change directory
    echo  ls             List files
    echo  echo [text]    Print text
    echo  mkdir [name]   Create folder
    echo  rm [file]      Delete file
    echo  rmdir [dir]    Delete directory
    echo  cat [file]     Show file contents
    echo.
    goto loop
)


if /i "%cmd%"=="clear" (
    cls
    goto loop
)


if /i "%cmd%"=="pwd" (
    cd
    goto loop
)


if /i "%cmd%"=="cd" (
    cd %args% 2>nul || echo Directory not found.
    goto loop
)


if /i "%cmd%"=="ls" (
    dir /b
    goto loop
)


if /i "%cmd%"=="echo" (
    echo %args%
    goto loop
)


if /i "%cmd%"=="mkdir" (
    md %args% 2>nul || echo Failed to create directory.
    goto loop
)


if /i "%cmd%"=="rm" (
    del /f /q %args% 2>nul || echo Failed to delete file.
    goto loop
)


if /i "%cmd%"=="rmdir" (
    rd /s /q %args% 2>nul || echo Failed to delete directory.
    goto loop
)


if /i "%cmd%"=="cat" (
    type %args% 2>nul || echo File not found.
    goto loop
)


%input%
goto loop

:exit
echo Exiting CMDShell...
endlocal
exit /b


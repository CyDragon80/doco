
@echo off

REM Just a quick example of how one might use within Windows
REM ( There is another example at https://github.com/dcodeIO/doco/issues/1 )
REM You can use this info to create a BAT for your individual needs (or use as-is).

REM .\bin\doco cannot be run directly in Windows (it doesn't know #! lines)
REM .\bin\doco must be passed to node.exe directly

REM This BAT file example assumes:
REM 1. node.exe is available through the PATH
REM 2. This BAT is in the root of the doco module's folder
REM 3. You just want to do markdown on one file

echo Usage: "doco_win.bat Filename-without-ext"
echo (.js and .md added automatically to name for input and output)

if "%1"=="" goto blank

node %~dp0bin\doco --gen=markdown %1.js > %1.md
REM '%~dp0' is the path to this BAT file, '%1' is the first arg after bat file itself, '%*' would be all args
REM You could just pass all the arguments through using:
REM  node %~dp0bin\doco %*
REM Or if you want to put a BAT in a folder where doco is installed as dependency
REM  node %~dp0node_modules\doco\bin\doco %*
GOTO DONE

:BLANK
echo !! You must enter a file name (omitting .js) !!

:DONE

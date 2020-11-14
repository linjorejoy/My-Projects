
@echo off

setlocal EnableDelayedExpansion

set num=1
set fnam="File Name"

for %%x in (*.*) do (
	
		set ext=%%~xx
		REM echo !ext!
	if !ext! NEQ .bat (
		set var=000!num!
		set var=!var:~-3!

		REM echo !var!

		echo !fnam!!var!!ext!

		ren "%%x" !fnam!!var!!ext!

		REM echo !num!
		set /a num=num+1
		)
	)
pause
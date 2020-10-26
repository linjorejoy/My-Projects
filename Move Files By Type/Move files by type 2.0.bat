@ECHO OFF
rem ################################################################
REM			CREATING DIRECTORIES
rem ################################################################

IF exist "Moved Files" (ECHO CHECKED) ELSE (mkdir "Moved Files")

cd "Moved Files"
IF exist Documents (ECHO CHECKED) ELSE (mkdir Documents)
cd Documents
IF exist "Word Files" (ECHO CHECKED) ELSE (mkdir "Word Files")
IF exist Powerpoint (ECHO CHECKED) ELSE (mkdir Powerpoint)
IF exist PDF (ECHO CHECKED) ELSE (mkdir PDF)
IF exist Excel (ECHO CHECKED) ELSE (mkdir Excel)
IF exist "Text Files" (ECHO CHECKED) ELSE (mkdir "Text Files")
IF exist XML (ECHO CHECKED) ELSE (mkdir XML)
IF exist SVG (ECHO CHECKED) ELSE (mkdir SVG)
cd ..

IF exist Music (ECHO CHECKED) ELSE (mkdir Music)

IF exist Pictures (ECHO CHECKED) ELSE (mkdir Pictures)

IF exist Videos (ECHO CHECKED) ELSE (mkdir Videos)

IF exist "CAD type FILES" (ECHO CHECKED) ELSE (mkdir "CAD type FILES")

IF exist Compressed (ECHO CHECKED) ELSE (mkdir Compressed)

IF exist Programs (ECHO CHECKED) ELSE (mkdir Programs)
cd Programs
IF exist Scripts (ECHO CHECKED) ELSE (mkdir Scripts)
IF exist "Web Pages" (ECHO CHECKED) ELSE (mkdir "Web Pages")


cd ..\..
::IF exist DIR (ECHO CHECKED) ELSE (mkdir dir)


rem ################################################################
REM			MOVING FILES
rem ################################################################

@ECHO OFF

REM Documents
move *.docx "Moved Files\Documents\Word Files"
move *.odt "Moved Files\Documents\Word Files"
move *.doc "Moved Files\Documents\Word Files"
move *.ppt "Moved Files\Documents\Powerpoint"
move *.pptx "Moved Files\Documents\Powerpoint"
move *.pdf "Moved Files\Documents\PDF"
move *.xls "Moved Files\Documents\Excel"
move *.xlsx "Moved Files\Documents\Excel"
move *.csv "Moved Files\Documents\Excel"
move *.tsv "Moved Files\Documents\Excel"
move *.txt "Moved Files\Documents\Text Files"
move *.xml "Moved Files\Documents\XML"
move *.svg "Moved Files\Documents\SVG"

REM Music
move *.mp3 "Moved Files\Music"
move *.wav "Moved Files\Music"

REM Pictures
Move *.jpg "Moved Files\Pictures"
Move *.jpeg "Moved Files\Pictures"
Move *.png "Moved Files\Pictures"
Move *.bmp "Moved Files\Pictures"
Move *.gif "Moved Files\Pictures"

REM Video
move *.mp4 "Moved Files\Videos"
move *.wmv "Moved Files\Videos"
move *.avi "Moved Files\Videos"
move *.srt "Moved Files\Videos"

REM Compressed
move *.rar "Moved Files\Compressed"
move *.zip "Moved Files\Compressed"
move *.gz "Moved Files\Compressed"

rem Programs
move *.exe "Moved Files\Programs"
move *.msi "Moved Files\Programs"
move *.class "Moved Files\Programs"
move *.py "Moved Files\Programs\Scripts"
move *.java "Moved Files\Programs\Scripts"
move *.HTML "Programs\Web Pages"

rem CAD type FILES
move "*.step" "Moved Files\CAD type FILES"
move "*.igs" "Moved Files\CAD type FILES"
move "*.sldprt" "Moved Files\CAD type FILES"
move "*.sldasm" "Moved Files\CAD type FILES"
move "*.slddrw" "Moved Files\CAD type FILES"
pause
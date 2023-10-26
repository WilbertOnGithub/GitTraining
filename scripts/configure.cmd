@ECHO OFF

IF EXIST "%LOCALAPPDATA%\Microsoft\WindowsApps\Winget.Exe" (
	ECHO "Winget found - using it to install software"
	GOTO WinGetInstalled
)
ECHO Could not find Winget. 
ECHO Please check if you have installed it.
ECHO Re-run the script after fixing this problem.
EXIT /B 1

:WinGetInstalled

REM Use Winget to install all dependencies

winget install -e --id Git.Git
winget install -e --id Notepad++.Notepad++
winget install -e --id Perforce.P4Merge

REM Add Git to system path (and also to the current session)
SETX /M PATH "%PATH%;C:\Program Files\Git"
PATH "%PATH%;C:\Program Files\Git"

REM Configure Git to use P4Merge

git config --global merge.tool p4merge
git config --global diff.tool p4merge
git config --global mergetool.keepBackup false

REM Set Notepad++ as main editor

:ConfigureNotepad
IF EXIST "C:\Program Files\Notepad++\notepad++.exe" (
	git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
	GOTO ConfigureP4Merge
)
IF EXIST "C:\Program Files (x86)\Notepad++\notepad++.exe" (
	git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
	GOTO ConfigureP4Merge
)
ECHO Could not find Notepad++ at Program Files\Notepad++ or Program Files (x86)\Notepad++. 
ECHO Please check if you have installed it.
ECHO Re-run the script after fixing this problem.
EXIT /B 1

REM Explicitly set path to P4Merge

:ConfigureP4Merge
IF EXIST "C:\Program Files\Perforce\p4merge.exe" (
	git config --global mergetool.p4merge.path "C:/Program Files/Perforce/p4merge.exe"
	GOTO Succes
)
IF EXIST "C:\Program Files (x86)\Perforce\p4merge.exe" (
	git config --global mergetool.p4merge.path "C:/Program Files (x86)/Perforce/p4merge.exe"
	GOTO Succes
)
ECHO Could not find P4Merge at Program Files\Perforce\ or Program Files (x86)\Perforce\
ECHO Please check if you have installed it.
ECHO Re-run the script after fixing this problem.
EXIT /B 1

:Succes
ECHO Succes! Your Git installation is now configured to use Notepad++ as an editor and P4Merge as a diff/mergetool.

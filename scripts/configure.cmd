@ECHO OFF

IF EXIST "%LOCALAPPDATA%\Microsoft\WindowsApps\Winget.Exe" (
	ECHO Winget found - using it to install dependencies.
	GOTO WinGetInstalled
)
ECHO Could not find Winget. It should have been available on a default Windows 10/11 installation.
ECHO Try to manually install it. See the following link for details:
ECHO https://learn.microsoft.com/en-us/windows/package-manager/winget/
ECHO Re-run the script after fixing this problem.
EXIT /B 1


:WinGetInstalled
REM Ask for email and username to be used in the Git config
SET /p "email=Enter your ICT email adres: "
SET /p "name=Enter your name: "

REM Use Winget to install all dependencies

winget install -e --id Git.Git --accept-source-agreements --accept-package-agreements 
winget install -e --id Notepad++.Notepad++ --accept-source-agreements --accept-package-agreements 
winget install -e --id Perforce.P4Merge --accept-source-agreements --accept-package-agreements 

REM Add Git permanently to system path so we can use it in the training
SETX /M PATH "%PATH%C:\Program Files\Git\Cmd"

REM Configure Git to use P4Merge

"%PROGRAMFILES%\Git\cmd\git.exe" config --global merge.tool p4merge
"%PROGRAMFILES%\Git\cmd\git.exe" config --global diff.tool p4merge
"%PROGRAMFILES%\Git\cmd\git.exe" config --global mergetool.keepBackup false
"%PROGRAMFILES%\Git\cmd\git.exe" config --global difftool.prompt false
"%PROGRAMFILES%\Git\cmd\git.exe" config --global user.email %email%
"%PROGRAMFILES%\Git\cmd\git.exe" config --global user.name "%name%"

REM Set Notepad++ as main editor

:ConfigureNotepad
IF EXIST "%PROGRAMFILES%\Notepad++\notepad++.exe" (
	"%PROGRAMFILES%\Git\cmd\git.exe" config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
	GOTO ConfigureP4Merge
)
IF EXIST "%PROGRAMFILES(X86)%\Notepad++\notepad++.exe" (
	"%PROGRAMFILES%\Git\cmd\git.exe" config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
	GOTO ConfigureP4Merge
)
ECHO Could not find Notepad++ at %PROGRAMFILES%\Notepad++ or %PROGRAMFILES(X86)%\Notepad++. 
ECHO Please check if you have installed it.
ECHO Re-run the script after fixing this problem.
EXIT /B 1

REM Explicitly set path to P4Merge

:ConfigureP4Merge
IF EXIST "%PROGRAMFILES%\Perforce\p4merge.exe" (
	"%PROGRAMFILES%\Git\cmd\git.exe" config --global mergetool.p4merge.path "C:/Program Files/Perforce/p4merge.exe"
	GOTO Succes
)
IF EXIST "%PROGRAMFILES(X86)%\Perforce\p4merge.exe" (
	"%PROGRAMFILES%\Git\cmd\git.exe" config --global mergetool.p4merge.path "C:/Program Files (x86)/Perforce/p4merge.exe"
	GOTO Succes
)
ECHO Could not find P4Merge at %PROGRAMFILES%\Perforce\ or %PROGRAMFILES(X86)%\Perforce\
ECHO Please check if you have installed it.
ECHO Re-run the script after fixing this problem.
EXIT /B 1

:Succes
ECHO Succes! Your Git installation is now configured to use Notepad++ as an editor and P4Merge as a diff/mergetool.
ECHO Close this terminal session now.

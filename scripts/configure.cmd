@ECHO OFF

git config --global merge.tool p4merge
git config --global diff.tool p4merge
git config --global mergetool.keepBackup false

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

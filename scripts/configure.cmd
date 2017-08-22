@ECHO OFF

IF NOT EXIST "C:\Program Files\Perforce\p4merge.exe" (
    ECHO Could not find p4merge.exe at C:\Program Files\Perforce.
    EXIT /B 1
)

IF NOT EXIST "C:\Program Files\Notepad++\notepad++.exe" (
    ECHO Could not find notepad++.exe at C:\Program Files\Notepad++.    
    EXIT /B 1
)

ECHO Found locations for P4Merge and Notepad++. Starting configuration...

git config --global merge.tool p4merge
git config --global diff.tool p4merge
git config --global mergetool.p4merge.path "C:/Program Files/Perforce/p4merge.exe"

git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

ECHO Done! Your Git installation is now configured to use Notepad++ as an editor and P4Merge as a diff/mergetool.

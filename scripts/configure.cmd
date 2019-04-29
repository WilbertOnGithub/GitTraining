@ECHO OFF

IF NOT EXIST "C:\Program Files\Perforce\p4merge.exe" (
    ECHO Could not find p4merge.exe at C:\Program Files\Perforce.    
    ECHO Please check the path to see if you installed the Perforce merge tool in the default location.    
    ECHO If you installed p4merge in a different location please modify this script to use the correct location.           
    ECHO Re-run the script after fixing this problem.    
    EXIT /B 1
)

IF NOT EXIST "C:\Program Files\Notepad++\notepad++.exe" (
    ECHO Could not find notepad++.exe at C:\Program Files\Notepad++.    
    ECHO Please check the path to see if you installed Notepad++ in the default location.
    ECHO If you installed Notepad++ in a different location please modify this script to use the correct location.       
    ECHO Re-run the script after fixing this problem.
    EXIT /B 1
)

ECHO Found locations for P4Merge and Notepad++. Starting configuration...

git config --global merge.tool p4merge
git config --global diff.tool p4merge
git config --global mergetool.p4merge.path "C:/Program Files/Perforce/p4merge.exe"
git config --global mergetool.keepBackup false

git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

ECHO Done! Your Git installation is now configured to use Notepad++ as an editor and P4Merge as a diff/mergetool.

****How to install and configure Git for Windows****

These are the instructions on how to download, install and configure Git and associated tooling.

First of all, you need to download the following software:

* [Git for Windows](https://git-scm.com/download/win)

  Simply use the suggested defaults when installing.

* [Notepad++](https://notepad-plus-plus.org/download) for use as an editor
* [Perforce Merge Tool](https://www.perforce.com/downloads/visual-merge-tool) as a diff and merge tool

  You have to select that you want to download a Windows version and if you want to use the 32- or 64-bits version. After that choice, indicate that you are an existing customer - that will start the download immediately. When installing only select the merge tool as indicated in the screenshot below.

  TODO: Add screenshot


Now the tools have been downloaded they still need to be configured. Git is tool-agnostic which is a fancy way of saying that it does not have a built-in editor or diff/merge tool. 

I've created a script that will do the following:

* Add Notepad++ to your PATH environment variable
* Configure Notepad++ as the default editor in Git
* Configure P4Merge as the default diff/merge tool in Git.

The script assumes that the tools have been installed in their default directories. Please run the script 


Are these instructions unclear? Since the instructions are in a Git repository, I accept pull requests! You can contact me at wilbert@arentheym.com.


****How to install and configure Git for Windows****

These are the instructions on how to configure Git for Windows to be able to use it in the training. 

First of all, you need to download and install the following software:

***Important note: I'm assuming you install the 64-bit versions of the software. The links below all lead to the 64-bit versions.***

* [Git for Windows](https://github.com/git-for-windows/git/releases/download/v2.14.1.windows.1/Git-2.14.1-64-bit.exe)

  Use the suggested defaults when installing.

* [Notepad++](https://notepad-plus-plus.org/repository/7.x/7.5.1/npp.7.5.1.Installer.x64.exe) for use as an editor
* [Perforce Merge Tool](http://www.perforce.com/downloads/perforce/r17.2/bin.ntx64/p4vinst64.exe) as a diff and merge tool

  When installing only select the merge tool as indicated in the screenshot below.

  ![Install P4Merge](screenshots/install_p4merge.png)  


Now the tools have been downloaded they still need to be configured to work correctly in Git.

I've created a script that will do the following:

* Configure Notepad++ as the default editor in Git
* Configure P4Merge as the default diff/merge tool in Git.

The script assumes that the tools have been installed in their default directories. The script will indicate if it encounters any errors.

<a href="https://cdn.rawgit.com/WilbertOnGithub/GitTraining/b604b858/scripts/configure.cmd" download target="_blank">Please download and save the script somewhere.</a>

Now, open a command prompt and run the _configure.cmd_ script. If all goes well, you will see a message that Git has been configured correctly.


Finally, there is one bit of configuration that cannot be handled by the script. Git needs to know your user information. Please enter the following commands in the command prompt while using your own name and email address.

`git config --global user.name "Enter your full name here"`

`git config --global user.email a.developer@ict.nl`

Done! You now have a version of Git for Windows which is configured with the correct tooling.

Are these instructions unclear? Please contact me at wilbert.van.dolleweerd@ict.nl with any questions you might have.


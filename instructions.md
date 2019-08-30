****How to install and configure Git for Windows****

These are the instructions on how to configure Git for Windows to be able to use it in the training. 

First of all, you need to download and install the following software:

* [Git for Windows](https://git-scm.com/download/win)

  Use the suggested defaults when installing.

* [Notepad++](https://notepad-plus-plus.org/repository/7.x/7.5.1/npp.7.5.1.Installer.x64.exe) for use as an editor
* [Perforce Merge Tool](http://www.perforce.com/downloads/perforce/r17.2/bin.ntx64/p4vinst64.exe) as a diff and merge tool

  When installing only select the merge tool as indicated in the screenshot below.

  ![Install P4Merge](screenshots/install_p4merge.png)  


Now the tools have been downloaded they still need to be configured to work correctly in Git.

I've created a script that will do the following:

* Configure Notepad++ as the default editor in Git
* Configure P4Merge as the default diff/merge tool in Git.

You should have received this script in an earlier email from me.

The script assumes that the tools have been installed in their default directories. The script will indicate if it encounters any errors.

Now, open a command prompt and run the _configure.cmd_ script. If all goes well, you will see a message that Git has been configured correctly.


Almost there, there is one bit of configuration that cannot be handled by the script. Git needs to know your user information. Please enter the following commands in the command prompt while using your own name and email address.

`git config --global user.name "Enter your full name here"`

`git config --global user.email a.developer@ict.nl`


And for the final step <a href="https://github.com/join" download target="_blank">you have to create a Github account.</a>. Use this link to create an account. You can use an existing Github account if you have
one or you can create a new one using your ICT email address. Please send me the account you're using so I can add you to the repository we are going to use.


Done! You now have a version of Git for Windows which is configured with the correct tooling.

Are these instructions unclear? Please contact me at wilbert.van.dolleweerd@ict.nl with any questions you might have.


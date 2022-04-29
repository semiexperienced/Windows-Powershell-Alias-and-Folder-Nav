# Windows-Powershell-Alias-and-Navigation
This is a script that can be added to the .ps1 file in the /Documents/WindowsPowerShell directory to add functions and linux aliases for windows functions.
Be sure to edit the script to determine if you want to navigate to your username directory only or have access to all users. The syntax differs with the first being "folder -U" and the second being "folder -U Username". The aliases were based off linux commands.

Examples of Usage:
     Folder -H         Display help. This is the same as not typing any options.
     Folder -U         Change to the 'Username' directory
     Folder -S         Change to the 'scripts' directory
     Folder -D         Change to the 'desktop' directory
     
Aliases:
cat = Type
cp =copy
ip = ip config 
cpr = xcopy 
grep = find
man = help 
mv = move 
ps = tasklist
rm = del
rmr = deltree

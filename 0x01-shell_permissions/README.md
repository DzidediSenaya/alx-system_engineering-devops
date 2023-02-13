u betty switches user to betty

whoami displays the username of the current user

groups prints out all the groups the current user is part of

chown command changes file ownership

touch command creates an empty file

chmod u+x makes the file executable for your user

chmod u+x,g+x,o+r filename executes permission to the owner and the group owner, and read permission to other users, to the file

chmod a+x filename adds execution permission to the owner, the group owner and the other users, to the file

chmod 007 filename gives no executable permission to owner and group but all permissions to other users

chmod 753 filename sets the mode of the file to -rwxr-x-wx

chmod --reference=olleh hello sets the mode of the file hello the same as olleh’s mode

chmod -R a+X .   adds execute permission to all subdirectories of the current directory for the owner, the group owner and all other users. Regular files should not be changed

chown -R vincent:staff .   changes the owner to vincent and the group owner to staff for all the files and directories in the working directory.

chown -h vincent:staff _hello    changes the owner and the group owner of _hello to vincent and staff respectively

chown --from=guillaume betty hello    changes the owner of the file hello to betty only if it is owned by the user guillaume

 telnet towel.blinkenlights.nl    will play the StarWars IV episode in the terminal.

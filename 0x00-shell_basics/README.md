pwd prints the absolute path name of the current working directory

ls displays the contents list of your current directory

cd switches to home directory

ls-la lists directory contents in long format

ls –a lists all file contents including hidden files

mkdir /tmp/my_first_directory  creates a directory called my_first_directory

mv /tmp/betty /tmp/my_first_directory/   Moves the file betty from /tmp/ to /tmp/my_first_directory

rm /tmp/my_first_directory/betty    deletes betty

rm -r /tmp/my_first_directory    deletes directory called my_first_directory

cd -   switches to previous directory

ls -la . .. /boot     lists all files in the current directory and the parent of the working directory and the /boot directory, in long format

file /tmp/iamafile     prints the type of the file named iamafile. The file iamafile will be in the /tmp directory when we will run your script

ln -s /bin/ls __ls__  symbolic link to /bin/ls, named __ls__

cp -u *.html ..     copies all the HTML files from the current working directory to the parent of the working directory, but only copy files that did not exist in the parent of the working directory or were newer than the versions in the parent of the working directory.



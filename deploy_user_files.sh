#!/usr/bin/sh

### Copies a list of files, from `deploy_files.txt`, to their appropriate
### locations.
###
### See `deploy_files.txt` to see what files are being copied.
###
### Requires root permissions to function properly.

### The location of the user home directory.
###
### This is used to substitute the "~" character in the locations specified in
### "deploy_files.txt"
USER_HOME="/home/anurag"

[ "$(id -u)" -ne 0 ] && \
echo "[ERROR] Copying user files needs root privileges to function properly" && exit 1

## Check if 'deploy_files.txt' exists and is readable
[ ! -r ./deploy_files.txt ] && \
echo "[ERROR] Could not find \"deploy_files.txt\". Are you sure it exists?" && exit 1

## Read list of files.

## If the file mentioned at the 2nd field exists and is a directory, assume
## that as a location.

### Since the script is run with elevated privileges, "~" will refer to "/root"
### instead of the user's home directory. The "sub" function of awk replaces
### the "~" character and with USER_HOME.
awk -v home=$USER_HOME '
    ! /^#.*$|^$/ {
        copy_from=3;
        copy_as="";
        if(system("test -d "$2) == 0) {
            copy_from=2;
        } else {
            copy_as=$2;
        }
        for( i=copy_from ; i <= NF ; ++i ){
            sub(/^~/, home, $i);
            system("cp -iv ./files/"$1" "$i"/"copy_as);
        }
    }' deploy_files.txt

unset USER_HOME
exit 0

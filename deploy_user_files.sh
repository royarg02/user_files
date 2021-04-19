#!/usr/bin/sh

# user_files - Anurag Roy's dotfiles and config files alongwith scripts
# to copy and deploy them.
#    Copyright (C) 2021 Anurag Roy
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

### Copies a list of files, from `deploy_files.csv`, to their appropriate
### locations.
###
### See `deploy_files.csv` to see what files are being copied.
###
### Requires root permissions to function properly.

### Copies a file to a specified directory.
###
### [$1] is the file name in the repo, [$2] the new file name and [$3] the
### folder name/location(will be newly made if non-existent).
###
### The files to be copied are present in the `./files/` directory.
###
### If the specified file already exists, then `cp` prompts for user input
### regarding whether the file should be overidden or not.
copy_file() {
  ### If the file already exists, provide a diff
  if [ -e "$3/$2" ]; then
    diff -us --color "$3/$2" "./files/$1"
    printf "\nOverwrite %s/%s? (y/Y for yes)\t" "$3" "$2"
    read -r overwrite < /dev/tty
    echo "$overwrite" | grep -q 'y\|Y' || { old=1 && return ; }
  fi
  mkdir -pv "$3"
  ### Create a backup of the old file before copying
  cp -rT "$3/$2" "$3/$2.old"
  cp -vrT "./files/$1" "$3/$2"
  echo "[INFO] Old $3/$2 copied to $3/$2.old."
  old=0
}

### Between two paths of equal or unequal length, removes the longest matching
### common path and provides the root folder of the resulting location.
###
### ```sh
### $ x="/home/anurag"; y="/home/anurag/some_folder"
### $ echo "${x#$y/}" ('/' is added to remove the leading character)
### /home/anurag (no match for "/home/anurag/some_folder" in "/home/anurag")
### $ echo "${y#$x/}"
### some_folder
### ```
###
### The function additionally cuts and returns the first field which would be
### the root of the non-matching location.
strip_path() {
  full_path="$2"
  remove_path="$1"
  echo "${full_path#$remove_path/}" | cut -d '/' -f1
}

### In case the user uses the `.profile` and `.rootprofile` file as-is, reminds
### them to create the bash history folder.
make_bash_history() {
  cat << END

In case you haven't changed the "HISTFILE" value in ".profile" and ".rootprofile"
and copied those files to your system, run:

	mkdir -pv ~/.local/share/bash
	sudo mkdir -pv /root/.local/share/bash

for bash to create the history file at the new location.

END
}

### Displays the LICENSE applied to this project.
###
### GNU General Public License - Version 3.0
show_license() {
  cat << END

Deploy user files Copyright (C) 2021 Anurag Roy
    This program comes with ABSOLUTELY NO WARRANTY. This is free software,
    and you are welcome to redistribute it under certain conditions.
    For more details see http://www.gnu.org/licenses/gpl-3.0.html.

END
}

### Show LICENSE information
show_license

### Check root permissions
[ "$(id -u)" -ne 0 ] && \
echo "[ERROR] Copying user files needs root privileges to function properly." && exit 1

### Check if 'deploy_files.csv' exists and is readable
[ ! -r ./deploy_files.csv ] && \
echo "[ERROR] Could not find \"deploy_files.csv\" in the current folder. Are you sure it exists?" && exit 1

### Get user name through direct shell input
echo "Enter the username. <Return> to use current username. <Control-C> to abort.";
read -r USERNAME;

### [USERNAME] should be [SUDO_USER] by default.
USERNAME=${USERNAME:-"$SUDO_USER"}

### The location of the user home directory.
###
### This is used to substitute the "~" character in the locations specified in
### "deploy_files.csv"
USER_HOME="/home/$USERNAME"

### Check if USER_HOME actually exists
[ ! -d "$USER_HOME" ] && \
echo "[ERROR] \"$USER_HOME\" doesn't exist! Ensure that the username is correct." && exit 1

### Construct a temporary file to read by removing comments from
### "deploy_files.csv".
sed '/^#\|^$/d' deploy_files.csv > /tmp/files.csv

### Set field separator to read file.
IFS=","

### The actual loop to read and deploy files.
###
### [file] is the filename in the repo, [newfile] the file name to be copied as
### and [locations] the list of locations to be copied to.
while read -r file newfile locations; do
  for location in $locations; do
    ### Skip empty locations, for the sake of better csv formatting
    echo "$location" | grep '^$' > /dev/null && continue
    ### Replace "~" by [USER_HOME].
    ###
    ### Since the script is run with elevated privileges, "~" will refer to
    ### "/root" instead of the user's home directory.
    location=$(echo "$location" | sed "s|^\~|$USER_HOME|")
    ### Only absolute file paths are allowed.
    ###
    ### The script skips the location if it fails this condition.
    echo "$location" | grep '^/.*' > /dev/null
    [ "$?" -eq 1 ] && \
      echo "[ERROR] \"$location\" is not an absolute path. Skipping this location." && continue
    ### "/." is added to prevent `dirname` to strip path without checking owner
    ### in the first iteration.
    dir="$location/."
    ### Traverse upward through the given location until an owner is found.
    while [ -z "$owner" ]; do
      dir="$(dirname "$dir")"
      owner=$([ -d "$dir" ] && stat -c '%U' "$dir")
      case "$owner" in
        "") ;;
        "root") copy_file "$file" "$newfile" "$location" ;;
        ### If the location is owned by anyone other than the root user, use
        ### `chown -R` to change owner of the newly created files/folders to
        ### that user after they have been copied/created.
        ###
        ### If `old` is `0`, chown the ".old" file as well.
        *) copy_file "$file" "$newfile" "$location" && \
          new_location="$location/$newfile" && \
          chown -R "$owner":"$owner" "$dir/$(strip_path "$dir" "$new_location")" && \
          [ "$old" -eq 0 ] && chown -R "$owner":"$owner" "$dir/$(strip_path "$dir" "$new_location.old")" ;;
      esac
    done
    ### Reset [owner] for the next location.
    owner=''
  done
done < /tmp/files.csv

echo "[INFO] Done deploying files."
echo "Make sure to log out and login again for the deployed files to take effect."

make_bash_history

unset full_path remove_path location new_location dir owner USERNAME USER_HOME IFS old
unset -f copy_files strip_path show_license make_bash_history
exit 0

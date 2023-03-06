#!/usr/bin/sh

# user_files - Anurag Roy's dotfiles and config files alongwith scripts
# to copy and deploy them.
#    Copyright (C) 2021, 2022 Anurag Roy
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

## Copies a list of files, defaultly from `deploy_files.csv`, to their
## appropriate locations.
##
## See `deploy_files.csv` to see what files are being copied.
##
## Requires root permissions to function properly.

## Verifies if the script is run in "dry-run" mode.
##
## Successful only if the environment variable "DRY_RUN" is set to "1".
is_dry_run() {
  [ "$DRY_RUN" -eq 1 ] && return 0
  return 1
}

## Verifies if the script is run in "no-confirm" mode.
##
## Successful only if the environment variable "NO_CONFIRM" is set to "1".
is_no_confirm() {
  [ "$NO_CONFIRM" -eq 1 ] && return 0
  return 1
}

## Helper for displaying informative messages.
##
## Takes a string [$1] as the message to display. This is typically used to
## inform the successful execution of an external command.
##
## An empty message results in a no-op.
display_info() {
  [ -n "$1" ] && printf "[INFO] %s\n" "$1"
}

## Helper for displaying error messages.
##
## Takes a string [$1] as the message to display. An empty message results in a
## no-op.
display_error() {
  [ -n "$1" ] && printf "[ERROR] %s\n" "$1"
}

## Helper for exiting script in case of a fatal error.
##
## Takes a string [$1] as the message to display. An empty message results in a
## no-op.
die() {
  display_error "$1" && exit 1
}

## Helper for receiving user input.
##
## Takes an optional prompt string [$1].
user_input() {
  # Print the prompt to tty before taking input
  [ -n "$1" ] && printf "%s: " "$1" > /dev/tty
  read -r input < /dev/tty
  echo "$input"
}

## Helper for taking user input for yes/no confirmation.
##
## Returns a non-failing exit status for "yes" or "y" in any case.
confirm() {
  # If NO_CONFIRM is set, return as if the user has already confirmed the
  # operation.
  is_no_confirm && return 0

  input="$(user_input "$1 (y/Y/Yes/YES to confirm)")"
  case "$input" in
    [yY]|[yY][eE][sS]) return 0 ;;
    *) return 1
  esac
}

## Returns the root of the path in [$1] from which it differs with path [$2].
##
## Preferably, [$1] should be longer than [$2].
##
## ```sh
## $ x="/home/rarg"; y="/home/rarg/some_dir"
## $ echo "${x#$y/}" ('/' is added to remove the leading character)
## /home/rarg (no match for "/home/rarg/some_dir" in "/home/rarg")
## $ echo "${y#$x/}"
## some_dir
## ```
non_matching_path_root() {
  shorter_path="$2"
  longer_path="$1"
  echo "${longer_path#"$shorter_path/"}" | cut -d '/' -f1
}

## Helper for running external commands with "dry running".
##
## Takes a string [$1] as the command to run.
run_command() {
  # If the script is dry run, print the command and exit, else use `eval` to run
  # the command.
  is_dry_run && { printf "[DRY RUN] %s\n" "$1"; return 0; }
  eval "$1"
}

## Wrapper for `chown` to recursively change file [$2] ownership to a specified
## user [$1].
change_owner() {
  run_command "chown -R $1: $2"
}

## Copies a file to a specified directory.
##
## [$1] is the file name to be copied and [$2] is the full path of the new
## file(location tree will be newly made if non-existent).
##
## If the specified file already exists, then prompts for user input to confirm
## the overwrite. If allowed to do so, creates a backup of the file with ".old"
## suffix.
copy_file() {
  # If the file already exists, provide a diff
  if [ -e "$2" ]; then
    diff -usr --color "$2" "$1"
    echo
    confirm "Overwrite \"$2\"?" || return 1
    # Create a backup of the old file before copying
    run_command "cp -prT $2 $2.old" "Old $2 copied to $2.old"
  fi
  run_command "mkdir -pv $(dirname "$2")"
  run_command "cp -vrT $1 $2"
}

## Configures pacman.
##
## More details of configuration are available at the [PACMAN_CONFIG] file.
config_pacman_conf() {
  # Check if the sed script exists; return if missing
  [ -f "./$PACMAN_CONFIG" ] || { \
    display_error "Cannot find \"$PACMAN_CONFIG\" to configure pacman."; return 1; }
  conf="/etc/pacman.conf"
  display_info "Configuring pacman"
  # Make required changes to a temporary file
  new_conf="$(mktemp)"
  sed -Ef "$PACMAN_CONFIG" "$conf" > "$new_conf"
  # Use [copy_file] to display changes and ask for confirmation as necessary
  copy_file "$new_conf" "$conf"
  echo
}

## Displays the LICENSE applied to this project.
##
## GNU General Public License - Version 3.0
show_license() {
  cat << END

Deploy user files Copyright (C) 2021, 2022 Anurag Roy
    This program comes with ABSOLUTELY NO WARRANTY. This is free software,
    and you are welcome to redistribute it under certain conditions.
    For more details see http://www.gnu.org/licenses/gpl-3.0.html.

END
}

## Displays this message if dry run is activated.
dry_run_message() {
  cat << END
The script has been asked to run in "DRY RUN" mode.

As such, it will not make any changes to the files in the system but rather,
only display the commands it will execute upon normal mode.

END
}

## Displays this message if no confirm is activated.
no_confirm_message() {
  cat << END
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!CAUTION!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
The script has been asked to run in "NO CONFIRM" mode.

As such, it will NOT ask for your confirmation to overwrite existing files.
This may potentially lead to a broken system, unless the script is run on "DRY
RUN" mode.

If you choose to continue in the next prompt, there's no going back.

YOU HAVE BEEN WARNED.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!CAUTION!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

END
}

## Displays finishing instructions after file deployment.
finish_instructions() {
  cat << END
Done deploying files. Finishing instructions follow:

- The Firefox user settings are at "$home". Move this file to the desired
  profile directory to apply the settings.

- In case you haven't changed the "HISTFILE" value in ".profile" and
  ".rootprofile" and copied those files to your system, run:

    mkdir -pv ~/.local/share/bash

  as both user and root for bash to create the history file at the new location.

- Make sure to log out and login again for the deployed files to take effect.

END
}

## Important environment variables

## The location where the files to be deployed are listed.
##
## The file must follow formatting/listing conventions detailed in the README.
##
## By default, "deploy_files.csv" is used, which should be located at the
## current directory.
FILE_LIST="${FILE_LIST:-"deploy_files.csv"}"

## Sed script configuring pacman.
##
## An empty value skips pacman configuration.
##
## By default, "pacman.sed" is used, which should be located at the current
## directory.
PACMAN_CONFIG="${PACMAN_CONFIG:-"pacman.sed"}"

## Denotes if the script is run in dry run mode.
##
## If enabled, the script will only show the deploying commands without actually
## executing the commands.
##
## Disabled by default.
DRY_RUN="${DRY_RUN:-"0"}"

## Denotes if the script is run in no-confirm mode.
##
## If enabled, the script will not ask for confirmation for overwriting existing
## files.
##
## Disabled by default.
NO_CONFIRM="${NO_CONFIRM:-"0"}"

# Show LICENSE information
show_license

# Check root permissions
[ "$(id -u)" -ne 0 ] && die "Copying user files needs root privileges to function properly."

# Check if [FILE_LIST] exists and is readable
[ -r "./$FILE_LIST" ] || die "Cannot find \"$FILE_LIST\" to get the files to be deployed."

# If no confirm is activated, displays a message
is_no_confirm && no_confirm_message

# If dry run is activated, displays a message
is_dry_run && dry_run_message

# Get the user name if it is not provided through the environment.
USERNAME="${USERNAME:-$(user_input "Enter the username. <Return> to use current username. <Control-C> to abort.")}"

# [USERNAME] should be [SUDO_USER], or if "doas" is installed, [DOAS_USER] by
# default.
USERNAME="${USERNAME:-"${SUDO_USER:-"$DOAS_USER"}"}"

## The location of the user home directory.
##
## This is used to substitute the "~" character in the locations specified in
## [FILE_LIST] file.
home="/home/$USERNAME"

# Check if [home] actually exists
[ -d "$home" ] || die "\"$home\" doesn't exist! Ensure that the username is correct."

# Configure pacman if it exists(for Arch-based distros)
command -v pacman > /dev/null 2>&1 && config_pacman_conf

# Construct a temporary file to read by removing comments from [FILE_LIST].
temp="$(mktemp)"
sed '/^#\|^$/d' "$FILE_LIST" > "$temp"

# Set field separator to read file.
IFS=","

# The actual loop to read and deploy files.
# [file] is the filename in the repo, [newfile] the file name to be copied as
# and [locations] the list of locations to be copied to.
while read -r file newfile locations; do
  for location in $locations; do
    # Skip empty locations, for the sake of better csv formatting
    echo "$location" | grep -q '^$' && continue
    # Replace "~" by [home], otherwise "~" will refer to "/root" instead
    # of the user's home directory since the script is run with elevated
    # privileges.
    location=$(echo "$location" | sed "s|^\~|$home|")
    # Only absolute file paths are allowed. Skip locations otherwise.
    echo "$location" | grep -q '^/.*' || \
      { display_error "\"$location\" is not an absolute path. Skipping this location." && continue; }
    dir="$location"
    new_location="$location/$newfile"
    # Traverse upward through the given location until a directory exists
    until [ -d "$dir" ]; do
      dir="$(dirname "$dir")"
    done
    owner=$(stat -c '%U' "$dir")
    case "$owner" in
      "") ;;
      "root") copy_file "./files/$file" "$new_location" ;;
      # If the location is owned by anyone other than the root user, use
      # `chown -R` to change owner of the newly created files/directories to
      # that user after they have been copied/created.
      *) copy_file "./files/$file" "$new_location" && \
        change_owner "$owner" "$dir/$(non_matching_path_root "$dir" "$new_location")" ;;
    esac
    echo
    # Reset [owner] for the next location.
    unset owner
  done
done < "$temp"

# If the script has not been dry run, display finishing instructions.
is_dry_run || finish_instructions

exit 0

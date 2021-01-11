# user_files

Contains some (mainly dotfiles) files to be deployed on a fresh linux system.

Intended to go along with [manjaro_init](https://github.com/RoyARG02/manjaro-init).

The files to be deployed are present in `files` folder.

The name of the files, alongwith the location to be deployed (_read copied_) to and the new name are maintained in `deploy_files.txt`. Additional comments are mentioned in that file about its usage.

The **POSIX** compliant main script, `deploy_user_files.sh`, reads the file list from `deploy_files.txt`, and copies them according to the instructions. 
Executing the default instructions **will require superuser privileges**.

## Usage

  1. Clone the repository.
  2. Run `chmod +x deploy_user_files.sh`.
  3. Run `sudo ./deploy_user_files.sh`.

# user_files

Contains some (mainly dotfiles) files to be deployed on a fresh linux system.

Intended to go along with [manjaro-init](https://github.com/RoyARG02/manjaro-init).

The files to be deployed are present in `files` folder.

The name of the files, alongwith the location to be deployed (_read copied_) to and the new name are maintained in `deploy_files.csv`. Additional comments are mentioned in that file about its usage.

The **POSIX** compliant main script, `deploy_user_files.sh`, reads the file list from `deploy_files.csv`, and copies them according to the instructions. 
Executing the default instructions **will require superuser privileges**.

## Usage

  1. Clone the repository.
  2. If necessary, run `chmod +x deploy_user_files.sh`.
  3. Run `sudo ./deploy_user_files.sh`.

## Licensing

Commits upto [7164f1e](https://github.com/RoyARG02/user_files/commit/7164f1edc6e290e34102763a5369ce4803fefd83) are [MIT](https://opensource.org/licenses/MIT) licensed. Commits after that are [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html) licensed.

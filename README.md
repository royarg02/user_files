# user_files

Contains some (mainly dotfiles) files to be deployed on a fresh linux system.

Intended to go along with [manjaro-init](https://github.com/RoyARG02/manjaro-init).

The files to be deployed are present in `files` folder.

The name of the files, alongwith the location to be deployed (_read copied_) to and the new name are maintained in `deploy_files.csv`. See its usage [here](https://github.com/RoyARG02/user_files#files-copied).

The script `deploy_user_files.sh` reads the file list from `deploy_files.csv`, and copies them according to the instructions. Executing the default instructions **will require superuser privileges**.

## Usage

  1. Clone the repository.
  2. If necessary, run `chmod +x deploy_user_files.sh`.
  3. Run `sudo ./deploy_user_files.sh`.

## Files copied

The files to be copied alongwith the locations they should be copied to are listed in `deploy_files.csv` file.

Each line in the file specifies the files to be copied by this order:

`<name of the file in "./files" folder>,<name to be copied as>,<location(s) to be copied to>`

For instance, ".bashrc" for the root user is defined as:

`.rootbashrc,.bashrc,/root,`

*NOTE: The extra `,` at the end is merely for the purpose of better csv formatting and for Github to [prettify](https://github.com/RoyARG02/user_files/blob/master/deploy_files.csv) it. It makes no difference to the script whether you append single comma or hundreds at the end.*

If the file is copied as the same name in this repo, the same name is repeated twice. See the line to copy `.bashrc` file for an example.

If any file is to be copied to multiple locations, name them one after the other at the end of the line. All locations will have the file with the same name, so if different file names are desired, specify them in different lines.

It is required to define the location of the file as an absolute path, but `~` can be used to represent the user home directory.

**NOTE:** The file `firefox_user.js` will be defaultly copied to `~` folder.  Copy it to the desired firefox profile folder to apply the preferences.

## Licensing

Commits upto [7164f1e](https://github.com/RoyARG02/user_files/commit/7164f1edc6e290e34102763a5369ce4803fefd83) are [MIT](https://opensource.org/licenses/MIT) licensed. Commits after that are [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html) licensed.

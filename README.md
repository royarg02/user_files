# user_files

Contains configurations(including dotfiles) to be deployed on a fresh linux system. "Files" also refers to whole folders containing multiple files configuring a particular program(like X).

The files to be deployed are present in the [`files`](https://github.com/RoyARG02/user_files/tree/master/files) folder.

The name of the files, alongwith the locations to be deployed(_read copied_) to and the name of the files at the copied location are maintained in `deploy_files.csv`. See its usage [here](https://github.com/RoyARG02/user_files#files-copied).

The script `deploy_user_files.sh` reads the file list from `deploy_files.csv`, and copies them according to the instructions. Additionally, it adds some options to `pacman.conf`, provided that `pacman` exists(for Archlinux-based distros). Executing the default instructions **will require superuser privileges**.

## Usage

  1. Clone the repository.
  2. If necessary, run `chmod +x deploy_user_files.sh`.
  3. Run `sudo ./deploy_user_files.sh`.

_Some files in the `files` folder are system dependent, for instance `xinitrc` and `gitconfig`. To avoid breaking other systems, **if a file with the same name exists**, the script will display a diff before giving the option to copy._

## Files copied

The files to be copied alongwith the locations they would be copied to are listed in `deploy_files.csv` file.

Each line in the file specifies the files to be copied in this order:

`<name of the file in "files" folder>,<name to be copied as>,<location(s) to be copied to>`

For instance, ".bashrc" for the root user is defined as:

`dot.rootbashrc,.bashrc,/root,`

_The extra `','` at the end is merely for the purpose of better csv formatting and for Github to [prettify](https://github.com/RoyARG02/user_files/blob/master/deploy_files.csv) it. It makes no difference to the script whether you append single comma or hundreds at the end._

If the file is to be copied as the same name as in this repo, the name is repeated twice. See the line to copy `fonts.conf` file for an example.

If any file is to be copied to multiple locations, name them one after the other at the end of the line, separated by commas. All locations will have the file with the same name, so if different file names are desired, specify them in different lines.

It is **required** to define the location of the file as an **absolute path**, but `~` can be used to represent the user home directory.

### File specific instructions

* The file `firefox_user.js` will be defaultly copied to `~` folder.  Copy it to the desired firefox profile folder to apply the preferences.

## About permissions and ownership

The files copied already have their permissions and ownership set as it is on my system. The permissions can be kept intact, but the owner is something you would want to change. The `deploy_user_files.sh` script currently determines the appropriate ownership depending upon the _parent folder the file is being copied to_, for instance,

```txt
for the file .bashrc specified as dot.bashrc,.bashrc,~

location to be copied to: /home/<username>
                                ^
                                | owner is <username>

/home/<username>/.bashrc will have owner <username>


for the file nobeep.conf specified as nobeep.conf,nobeep.conf,/etc/modprobe.d

location to be copied to: /etc/modprobe.d
                               ^
                               | owner is root

/etc/modprobe.d/nobeep.conf will have owner as root


A hypothetical example:
for the file specified as afile,new_file,~/existing_dir/non_existing_dir/another_non_existing_dir

location to be copied to: /home/<username>/existing_dir/non_existing_dir/another_non_existing_dir
                                           ^            ^                ^
                                           |            |                | folder doesn't exist, check parent dir
                                           |            |
                                           |            | folder doesn't exist, check parent dir
                                           |
                                           | folder exists, owner is <username>

/home/<username>/existing_dir/non_existing_dir/another_non_existing_dir/new_file will have owner as <username>
```

The `<username>` can be the current user running the script or a specified user given to the script at the beginning before it begins copying files.

## Addtional notes

* The scripts currently **do not have tests**. Although it performed as expected in my manual tests, execute with caution.
* **Licensing:** Commits upto [7164f1e](https://github.com/RoyARG02/user_files/commit/7164f1edc6e290e34102763a5369ce4803fefd83) are [MIT](https://opensource.org/licenses/MIT) licensed. Commits after that are [GPLv3](https://www.gnu.org/licenses/gpl-3.0.html) licensed.

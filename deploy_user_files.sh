#!/usr/bin/sh

### Copies a list of files, from `deploy_files.txt`, to their
### appropriate locations.
###
### See `deploy_files.txt` to see what files are being copied.
###
### Requires root permissions to function properly.

[ $(id -u) -ne 0 ] && \
echo "[ERROR] Copying user files needs root privileges to function properly" && exit 1

[ -r ./deploy_files.txt ] || \
echo "[ERROR] Could not find "deploy_files.txt". Are you sure it exists?" && exit 1

## Read list of files
## TODO

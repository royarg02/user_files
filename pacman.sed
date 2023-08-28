## Sed script to configure pacman.
##
## Enables:
## * Color
## * Tabular list of transactions(upgrade, sync, remove)
## * Easter egg
## * Anurag Roy's unofficial arch repository

# Uncomment option to enable color
s/^#Color$/Color/

# Uncomment option to enable tabular list of transactions
s/^#VerbosePkgLists$/VerbosePkgLists/

# Delete any commented option for easter egg; add it after the last listed
# option(which should be ParallelDownloads)
/^#?ILoveCandy$/d
/^#ParallelDownloads.*$/a ILoveCandy

# Uncomment option for parallel downloads for up to 3 simultaneous packages
s/^#ParallelDownloads.*$/ParallelDownloads = 3/

# Append details of the unofficial repository at the end of the file
$a \
\
[royarg-repo] \
Server = https://royarg02.github.io/$repo/os/$arch

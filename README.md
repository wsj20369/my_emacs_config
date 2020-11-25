# Basic Emacs configs

Basic Emacs configs, used for writing C code and Org mode.

Supporting Both GUI and terminal (I tested under Windows 10 and Ubuntu 18.04 terminal)

# How to download

git clone https://github.com/wsj20369/my_emacs_config.git ~/.emacs.d

# About Evil

You can use the 'C-z' to switch Emacs mode / Vim mode

# About ggtags
Help to browse C/C++ code in Emacs

## Prepare
1. Install gnu global: `apt-get install global`
2. In project root: `gtags`, which will generate 3 file: GPATH GRTAGS GTAGS
3. In Emacs: `M-x ggtags-mode` (ggtags-mode will auto enabled in C/C++ mode)

## Key bindings:
1. C-]    ggtags-find-definition
2. M-]    ggtags-find-reference
3. F12    ggtags-update-tags

# About Projectile/Counsel-projectile
Find files in projects easily

## Key bindings:
1. F6     counsel-projectile-find-file

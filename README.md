# Basic Emacs configs

Basic Emacs configs, used for writing C code and Org mode.

Supporting Both GUI and terminal (I tested under Windows 10 and Ubuntu 18.04 terminal)

# How to download

git clone https://github.com/wsj20369/my_emacs_config.git ~/.emacs.d

# About Evil

You can use the 'C-z' to switch Emacs mode / Vim mode

# About ggtags, Browse C/C++ code in Emacs

## Prepare
1. Install gnu global: apt-get install global
2. In project root: gtags
   which will generate 3 file: GPATH GRTAGS GTAGS
3. M-x ggtags-mode
   ggtags-mode will auto enabled in C/C++ mode

## Key bindings:
   C-]    ggtags-find-definition
   M-]    ggtags-find-reference
   f12    ggtags-update-tags

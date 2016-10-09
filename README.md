# dotlinker

*yet another dotfile manager*

----------------------------------

Dotlinker is a simple script written in Ruby to manage dotfiles that are stored in a
central folder. It backs up any pre-existing file with that name and then symlinks the
chosen file into place in your home directory. It automatically handles the preceding `.` in front of a file, placing one in the symlink's name if there isn't one already.

Usage looks like
```shell
user@host:~/dotfile_folder$ dotlinker-ruby -v vimrc
linking /home/user/dotfile_folder/vimrc to /home/user/.vimrc
```

And without the `-v` or `--verbose` flag, it's pretty much the same deal.
```shell
user@host:~/dotfile_folder$ dotlinker-ruby -v vimrc
```

If a file already exists under that name, it backs up that file to dotfile_folder/backup/[backup-todays-date]
```shell
user@host:~/dotfile_folder$ dotlinker-ruby vimrc
moving existing .vimrc to backup-2016-10-09
linking /home/user/dotfiles/vimrc to /home/user/.vimrc
```

Here's what a sample `dotfile/` folder might look like. You're free to organize that however you
want, but `dotlinker` looks for a folder in the directory it's called from called backup.
```shell
├── backup
│   └── backup-2016-10-09
|        └── vimrc
├── bash
│   ├── bash_aliases
│   ├── bash_logout
│   ├── bashrc
│   └── profile
├── dotlinker-ruby -> /home/user/projects/dotlinker/dotlinker-ruby
├── git
│   └── gitconfig
├── go
│   └── gorc
├── irb
│   └── irbrc
├── nanorc
└── vim
    └── vimrc
```

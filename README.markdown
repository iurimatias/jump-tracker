VIM Jump Tracker
=============

Introduction
------------

Jump Tracker highlights the cursor line and cursor column whenever you jump the cursor. the highlight is automatically removed when you move the cursor to the previous/next line and/or character.
The cursor line is also highlighted when using insert mode.

Installation
------------

[pathogen.vim](https://github.com/tpope/vim-pathogen) is the recommended way to install jump tracker.

    cd ~/.vim/bundle
    git clone https://github.com/iurimatias/jump-tracker.git

Configuration
-------------

configure line & column color (default if 4F2F4F)

    let g:jump_line_color = "3F2A22"

configure insert mode line color (default is 236)

    let g:jump_insert_mode_color = 101

to disable changing line color when going into inset mode

    let g:jump_insert_mode_line = 0


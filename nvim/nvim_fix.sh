#!/bin/bash

cd /opt/homebrew/Cellar/neovim/0.10.0/share/
mkdir nvim_back
mv nvim/runtime/ftplugin/zig.vim nvim_back/zig.vim

# My Vim ENV

### [Install Vundle first](https://github.com/VundleVim/Vundle.vim#quick-start)

    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### [Just VIM](https://www.youtube.com/watch?v=XA2WjJbmmoM)

  I take the following config from [changemewtf/no_plugins](https://github.com/changemewtf/no_plugins)

  - Finding files
  - Tag jumping
  - Autocomplete
  - File browsing

### Nginx syntax highlight(MacOS)

```bash
$ mkdir -p ~/.vim/syntax/
$ wget http://www.vim.org/scripts/download_script.php?src_id=19394 -O ~/.vim/syntax/nginx.vim
$ cat > ~/.vim/filetype.vim <<EOF
au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif
EOF
```

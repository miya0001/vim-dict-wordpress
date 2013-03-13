# WordPress dict files for vim
---

vim-dict-wordpress is a distribution of WordPress dictionary files fro Vim.
This dictionary includes all action hooks, filter hooks and functions.

## How do I made the dict ?

 I was using grep to search hooks and functions.

    # action hooks
    find . -name "*.php" | xargs grep "do_action" \
    | sed "s/^.*do_action/do_action/g"| sed "s/);.*/);/g" \
    | sed "s/ //g" | sed "s/\"/\'/g" | sed "s/do_action(\'//g" \
    | sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | sort | uniq

    # filter hooks
    find . -name "*.php" | xargs grep "apply_filters" \
    | sed "s/^.*apply_filters/apply_filters/g"| sed "s/);.*/);/g" \
    | sed "s/ //g" | sed "s/\"/\'/g" | sed "s/apply_filters(\'//g" \
    | sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | sort | uniq

    # functions
    find . -name "*.php" -exec egrep '^function ' {} \; \
    | sed -e "s/function \(.*\)(.*/\1/g" | sed -e "s/^&//g" | sort | uniq

## Install

    $ cd ~/.vim/dict
    $ git clone git://github.com/miya0001/vim-dict-wordpress.git

finally, add line ~/.vimrc like below.

    autocmd FileType php :set dictionary=~/.vim/dict/vim-dict-wordpress/*.dict

## License

This dictionary file is released under the terms of the GPL version 2 or (at your option) any later version.


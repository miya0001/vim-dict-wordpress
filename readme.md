# WordPress dict files for vim
---

vim-dict-wordpress is a distribution of WordPress dictionary files for Vim.
This dictionary includes all action hooks, filter hooks and functions.

![Screen Shot](http://firegoby.jp/wp-content/uploads/2013/03/vim-wordpress-dict.png)

## How do I made the dict ?

 I was using grep to search hooks and functions.

```
# action hooks
find . -name "*.php" | xargs grep "do_action" \
| sed "s/^.*do_action/do_action/g"| sed "s/);.*/);/g" \
| sed "s/ //g" | sed "s/\"/\'/g" | sed "s/do_action(\'//g" \
| sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | tr -d ' ' | sort | uniq
```

```
# filter hooks
find . -name "*.php" | xargs grep "apply_filters" \
| sed "s/^.*apply_filters/apply_filters/g"| sed "s/);.*/);/g" \
| sed "s/ //g" | sed "s/\"/\'/g" | sed "s/apply_filters(\'//g" \
| sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | tr -d ' ' | sort | uniq
```

```
# functions
find . -name "*.php" -exec egrep '^function ' {} \; \
| sed -e "s/function \(.*\)(.*/\1/g" | sed -e "s/^&//g" \
| sed -e "s/(.*$//g" | tr -d ' ' |sort | uniq
```

```
# class
find . -name "*.php" | xargs grep "^class" \
| sed "s/.*\:class //g" \
| sed "s/ .*//g" | tr -d ' ' | sort | uniq
```

## Install

    $ cd ~/.vim/dict
    $ git clone git://github.com/miya0001/vim-dict-wordpress.git

finally, add line to ~/.vimrc like below.

    autocmd FileType php :set dictionary=~/.vim/dict/vim-dict-wordpress/*.dict

## License

This dictionary file is released under the terms of the GPL version 2 or (at your option) any later version.


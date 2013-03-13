# WordPress dict files for vim
---

vim-dict-wordpress is a distribution of WordPress dictionary files fro Vim.
This dictionary includes all action hooks, filter hooks and functions.

## How do I made the dict ?

    # action hooks
    find . -name "*.php" | xargs grep "do_action" | sed "s/^.*do_action/do_action/g"| sed "s/);.*/);/g" | sed "s/ //g" | sed "s/\"/\'/g" | sed "s/do_action(\'//g" | sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | sort | uniq

    # filter hooks
    find . -name "*.php" | xargs grep "apply_filters" | sed "s/^.*apply_filters/apply_filters/g"| sed "s/);.*/);/g" | sed "s/ //g" | sed "s/\"/\'/g" | sed "s/apply_filters(\'//g" | sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | sort | uniq

    # functions
    find . -name "*.php" -exec egrep '^function ' {} \; | sed -e "s/function \(.*\)(.*/\1/g" | sed -e "s/^&//g" | sort | uniq



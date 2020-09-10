#!/usr/bin/env bash

set -ex

curl -L https://wordpress.org/latest.tar.gz -o latest.tgz
tar zxvf latest.tgz
rm -fr wordpress/wp-content/

# action hooks
find wordpress -name "*.php" | xargs grep "do_action" \
| sed "s/^.*do_action/do_action/g"| sed "s/);.*/);/g" \
| sed "s/ //g" | sed "s/\"/\'/g" | sed "s/do_action(\'//g" \
| sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | tr -d ' ' | sort | uniq > ./action-hooks.dict

# filter hooks
find . -name "*.php" | xargs grep "apply_filters" \
| sed "s/^.*apply_filters/apply_filters/g"| sed "s/);.*/);/g" \
| sed "s/ //g" | sed "s/\"/\'/g" | sed "s/apply_filters(\'//g" \
| sed "s/\'.*$//g" | sed "s/^.*(.*$//g" | tr -d ' ' | sort | uniq > ./filter-hooks.dict

# functions
find . -name "*.php" -exec egrep '^function ' {} \; \
| sed -e "s/function \(.*\)(.*/\1/g" | sed -e "s/^&//g" \
| sed -e "s/(.*$//g" | tr -d ' ' |sort | uniq > ./functions.dict

# class
find . -name "*.php" | xargs grep "^class" \
| sed "s/.*\:class //g" \
| sed "s/ .*//g" | tr -d ' ' | sort | uniq > ./classes.dict

#!/bin/bash
# 1. List all files in path with find:
#       * print0: use \0 (null character) as the line delimiter; so file paths containing spaces/newlines don't break the script
# 2. Shuffle the file list with sort:
#       * -z: use \0 (null character) as delimiter, instead of \n (a newline)
#       * -R: random order
# 3. Strip first 100 lines from the randomized list with tail:
#       * -z: treat the list as zero-delimited(same as sort)
#       * -n +101: show lines starting from 101(ie. omit first 100 lines)
# 4. xargs -0 rm - remove the remaining files;
#       * -0: zero-delimited, again
find $1 -type f -print0 | sort -zR | tail -zn +51 | xargs -0 rm

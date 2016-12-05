#!/bin/bash

set -euo pipefail

gcc -Wall -Werror si7021.c -o si7021.bin

printf '' | crontab - # create the crontab if necessary so first crontab -l doesn't error-out
(crontab -l ; echo "*/5 * * * * $HOME/si7021.bin >> $HOME/si7021.log") | crontab -
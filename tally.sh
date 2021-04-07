#!/bin/bash

# This program is free software. It comes without any warranty, to the
# extent permitted by applicable law. You can redistribute it and/or modify
# it under the terms of the Do What The Fuck You Want To Public License,
# Version 2, as published by Sam Hocevar. See WTFPL.txt or
# http://www.wtfpl.net/ for more details.

source utilities.sh
source function_tally.sh
source function_new_food.sh
source function_interactive.sh

FOOD="x"
TALLY="0"
DATE="$(date "+%Y%m%d")"
TAB="state/days/${DATE}"

if [ -f "${TAB}" ]
then
  output "You have a tab for ${DATE}.  [c]ontinue or [o]verwrite? [C,o]  "
  read REPLY
  if echo "${REPLY}" | grep -i "^o"
  then
    output "Overwriting your old tab.\n"
    > "${TAB}"
  else
    output "Continuing your old tab.\n"
    TALLY="$(NONINTERACTIVE='y' tally < "${TAB}")"
    output "\n"
  fi
fi

tally

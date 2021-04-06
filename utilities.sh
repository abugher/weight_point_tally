#!/bin/bash

# This program is free software. It comes without any warranty, to the
# extent permitted by applicable law. You can redistribute it and/or modify
# it under the terms of the Do What The Fuck You Want To Public License,
# Version 2, as published by Sam Hocevar. See WTFPL.txt or
# http://www.wtfpl.net/ for more details.

e="echo -en"

function distill {
  echo "${*}" \
  | grep -vE "[^0-9\.]" \
  | head -n 1
}


PREFIX="${0##*/}:  "
function output() {
  printf '%s\n' "${PREFIX}${1}"
}


function error() {
  output "ERROR:  ${1}" >&2
}


function fail() {
  error "${1}"
  exit "${2:-1}"
}

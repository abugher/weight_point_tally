#!/bin/bash


function interactive() {
  if test 'set' = "${NONINTERACTIVE:+set}"; then
    false
  else
    true
  fi
}

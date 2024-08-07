#!/usr/bin/bash

export LANG=C.UTF-8
export TERM=xterm-256color

[ -f "env.sh" ] && . env.sh

exec vim

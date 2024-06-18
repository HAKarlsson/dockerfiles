#!/usr/bin/bash

export LANG=C.UTF-8

exec vim +'vert botright term ++close' +NERDTreeVCS

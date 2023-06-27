#!/bin/bash

# Arguments:
# $1 - refers to the generator binary
# $2 - refers to the corresponding *.ini file (not used in this context)
# All other arguments are handed over to the binary
./$1 ${@:3}
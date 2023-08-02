#!/bin/bash

TOOL_PATHS=($(cat $(dirname ${BASH_SOURCE[0]})/tool_paths.txt))

TOOL_BIN=${TOOL_PATHS[0]}
TOOL_INI=${TOOL_PATHS[1]}

$TOOL_BIN "$@"
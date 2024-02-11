#!/bin/bash

$1 -configuration . -data . --dest "$3" "${@:4}"
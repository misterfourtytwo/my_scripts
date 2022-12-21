#!/bin/bash

global_path="$(readlink -f -- $0)"
directory_path="$(dirname -- $script_path)/hooks"

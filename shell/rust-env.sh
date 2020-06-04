#!/bin/bash

docker run -it --rm --name rust-env --user "$(id -u)":"$(id -g)" -e USER=$USER -v "$PWD":/usr/src/myapp -w /usr/src/myapp rust-env:0.1 sh

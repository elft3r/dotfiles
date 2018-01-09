#!/bin/bash

readonly plugins_dir="${ZSH}/plugins"
readonly src_dir="/Applications/Docker.app/Contents/Resources/etc"

# first remove the old entries
rm -f ${plugins_dir}/docker/_docker
rm -f ${plugins_dir}/docker-compose/_docker-compose
rm -f ${plugins_dir}/docker-machine/_docker-machine

# finally create the links
ln -s ${src_dir}/docker.zsh-completion ${plugins_dir}/docker/_docker
ln -s ${src_dir}/docker-compose.zsh-completion ${plugins_dir}/docker-compose/_docker-compose
ln -s ${src_dir}/docker-machine.zsh-completion ${plugins_dir}/docker-machine/_docker-machine


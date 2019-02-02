#!/usr/bin/env ash

eval $(run-parts /etc/docker-entrypoint.d)

exec zsh

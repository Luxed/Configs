#!/usr/bin/env bash

set -e

if [ $1 == "alpine" ]; then
    apk update
    apk add vim

    # Enable community repos
    # TODO: Do this automatically if possible. Need to find line and remove leading #
    vim /etc/apk/repositories

    # Administration
    apk add doas

    # Enable wheel group in doas
    # TODO: Do this automatically, just like repositories
    vim /etc/doas.conf

    # Shell utilities & tools
    apk add fish htop bpytop git bapt iproute2-ss curl
    
    # Server
    apk add samba-server docker docker-compose

    # edit samba file (make generic, simple, guest config)

    # Install latest neovim version from edge repos. Only latest stable, so it might need to be changed for a manual build instead.
    #apk add -U neovim --repository http://alpinelinux.mirror.iweb.com/edge/community
    # better compile it from source because it updates (downgrades?!) otherwise

    # clone some useful repos
    git clone https://github.com/Luxed/Configs.git 
    git clone https://github.com/Luxed/nvim-config.git ~/.local/nvim

    # Install lazydocker, only available on testing repositories for now
    apk add -U lazydocker --repository http://alpinelinux.mirror.iweb.com/edge/testing

    # Add admin user
    read -p 'Username: '  username
    adduser -s /usr/bin/fish $username
    addgroup $username wheel
    addgroup $username docker
    addgroup $username nobody # userful for quick and easy anonymous share access

    # Services
    rc-update add docker boot
    service docker start

    rc-update add samba boot
    #service samba start

    # TODO: enable some form of auto update
fi

#!/usr/bin/env bash

set -e

if [ $1 == "alpine" ]; then
    apk update
    apk add vim

    # Enable community repos
    vim /etc/apk/repositories

    # Administration
    apk add doas

    # Enable wheel group in doas
    vim /etc/doas.conf

    # Shell utilities & tools
    apk add bash fish htop bpytop git bapt iproute2-ss curl
    
    # Server
    apk add samba-server docker docker-compose

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

    su $username git clone https://github.com/Luxed/nvim-config.git ~/.local/nvim

    su $username git clone https://github.com/neovim/neovim.git ~/git/neovim
    # Install neovim dependencies
    apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
    cd /home/cbrunel/git/neovim
    su $username make -j$(nproc) CMAKE_BUILD_TYPE=RelWithDebInfo
    make install
    cd -

    su $username git clone https://github.com/Luxed/Configs.git ~/git/Configs
    cp /home/cbrunel/git/Configs/files/smb.conf /etc/samba/smb.conf

    # lazydocker (custom install)
    wget https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh
    # script uses sudo by default, but I use doas instead
    sed -i 's/sudo/doas/' ./install_update_linux.sh
    chmod +x ./install_update_linux.sh
    ./install_update_linux.sh
    rm install_update_linux.sh

    echo "List of things to do now that everything is mostly setup:"
    echo "- Edit samba config"
    echo "- Docker compose things"
    echo "- Add /usr/local/bin to path (fish_add_path)"
fi

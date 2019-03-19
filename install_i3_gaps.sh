#!/bin/bash
sudo apt install -y i3 i3-wm
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake

cd /tmp

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
sudo apt-get install -y i3status i3lock-fancy
sudo apt-get install -y dmenu
sudo apt-get install -y rofi
sudo apt-get install -y blueman
sudo apt-get install -y alsa-utils
sudo apt-get install -y feh
sudo apt-get install -y xcompmgr
sudo apt-get install -y compton
sudo apt-get install -y devilspie
sudo apt-get install -y scrot xclip
mkdir -p ~/.devilspie
rsync -arl ./console.ds ~/.devilspie/
# 音量调节器
sudo apt-get install -y pnmixer
# i3lock
sudo apt-get install -y i3lock
# arandr
sudo apt-get install -y arandr

# copy config
rsync -arl i3.config ~/.config/i3/config

# copy wallpaper
rsync -arl space.jpeg ~/Pictures/

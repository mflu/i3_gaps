#!/bin/bash
sudo apt-get install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 libasound2-dev

cd /tmp

rm -rf /tmp/polybar

# clone the repository
git clone https://github.com/jaagr/polybar.git polybar
cd polybar
git checkout tags/3.3.0
# compile & install
chmod +x ./build.sh
./build.sh

mkdir -p ~/.config/polybar
rsync -arl polybar.config ~/.config/polybar
rysnc -arl launch_polybar.sh ~/.config/polybar

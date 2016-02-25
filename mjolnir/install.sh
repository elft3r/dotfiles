# You have to install mjolnir manually from http://mjolnir.io/
echo 'rocks_servers = { "http://rocks.moonscript.org" }' >> /usr/local/etc/luarocks52/config-5.2.lua

# Install all needed mjolnir packages
luarocks install mjolnir.alert
luarocks install mjolnir.hotkey
luarocks install mjolnir.screen
luarocks install mjolnir.application
luarocks install mjolnir.keycodes
luarocks install mjolnir.fnutils
luarocks install mjolnir.geometry

# install all needed user packages
luarocks install mjolnir.bg.grid
luarocks install mjolnir.lb.spotify 

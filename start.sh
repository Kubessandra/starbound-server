#!/bin/sh

echo "@sSteamCmdForcePlatformType linux
login $STEAM_USERNAME $STEAM_PASSWORD $STEAM_GUARD
force_install_dir /steamcmd/starbound
app_update 211820
quit" > /install.txt

echo "Install Starbound"
/steamcmd/steamcmd.sh +runscript /install.txt

echo "Run Starbound"
cd /steamcmd/starbound/linux
./starbound_server 2>&1
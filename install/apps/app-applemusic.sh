#!/bin/bash

cp music-icon-96.png USER/.local/share/omakub/applications/icons/Music.png

cat <<EOF >~/.local/share/applications/applemusic.desktop
[Desktop Entry]
Version=1.0
Name=Apple Music
Comment=Apple Music
Exec=google-chrome --app="https://music.apple.com/us/home" --name=Music --class=Music
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Music.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF


#!/bin/bash

# Create Simulink for scripts
rm -rf /home/${SUDO_USER}/.config/scripts
ln -s $(pwd)/scripts /home/${SUDO_USER}/.config/scripts
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) scripts were linked to .config"

# Place eww config
rm -rf /home/${SUDO_USER}/.config/eww
ln -s $(pwd)/eww /home/${SUDO_USER}/.config/eww
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) eww config was linked to .config"

# Place Rofi config
rm -rf /home/${SUDO_USER}/.config/rofi
ln -s $(pwd)/rofi /home/${SUDO_USER}/.config/rofi
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) rofi config was linked to .config"

# Check if XSessin File entry exists (so that chadwm appears in the session manager)
XSESSION_FILE="/usr/share/xsessions/chadwm.desktop"

if [ -f "${XSESSION_FILE}" ]; then
  echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) ${XSESSION_FILE} already exists!!!"
else
  echo "[Desktop Entry]"                                  >> ${XSESSION_FILE}
  echo "Name=chadwm"                                      >> ${XSESSION_FILE}
  echo "Comment=dwm made beautiful"                       >> ${XSESSION_FILE}
  echo "Exec=/home/${SUDO_USER}/.config/scripts/./run.sh" >> ${XSESSION_FILE}
  echo "Type=Application"                                 >> ${XSESSION_FILE}
  
  echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) XSession file entry was created"
fi

# Build chadwm
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) Building chadwm... \n"
rm $(pwd)/chadwm/config.h
cd $(pwd)/chadwm
sudo make install >> /dev/null

echo -e "\n$(tput bold setaf 6)Installation done, enjoy!!!\n"

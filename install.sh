#!/bin/bash

# Create Simulink for scripts
rm -rf /home/${SUDO_USER}/.config/scripts
ln -s $(pwd)/scripts /home/${SUDO_USER}/.config/scripts
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) scripts were linked to .config"

# Place Rofi config
rm -rf /home/${SUDO_USER}/.config/rofi
ln -s $(pwd)/rofi /home/${SUDO_USER}/.config/rofi
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) rofi config was linked to .config"

# Place Picom config
rm -rf /home/${SUDO_USER}/.config/picom
ln -s $(pwd)/picom /home/${SUDO_USER}/.config/picom
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) picom config was linked to .config"

# Place Xresources config
rm -rf /home/${SUDO_USER}/.Xresources
ln -s $(pwd)/bash/.Xresources /home/${SUDO_USER}/.Xresources
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) Xresources config was linked to .Xresources"

# Create Simulink for WezTerm
rm -rf /home/${SUDO_USER}/.config/wezterm
ln -s $(pwd)/wezterm /home/${SUDO_USER}/.config/wezterm
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) WezTerm config was linked to .config"

# Create Simulink for kitty
rm -rf /home/${SUDO_USER}/.config/kitty
mkdir /home/${SUDO_USER}/.config/kitty
ln -s $(pwd)/bash/kitty.conf /home/${SUDO_USER}/.config/kitty/kitty.conf
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) kitty config was linked to .config"

# Enable running brightnessctl wihtout sudo
sudo chmod +s /usr/bin/brightnessctl

# Place bashrc config
curl -s https://ohmyposh.dev/install.sh | sudo bash -s >>/dev/null # Install/Update Oh My Posh
rm -rf /home/${SUDO_USER}/.config/bash_theme.omp.json
ln -s $(pwd)/bash/theme.omp.json /home/${SUDO_USER}/.config/bash_theme.omp.json
rm -rf /home/${SUDO_USER}/.bashrc
ln -s $(pwd)/bash/.bashrc /home/${SUDO_USER}/.bashrc
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) bash config was linked to .bashrc"

# Install fzf-tab-completion
FZF_PATH_COMPLETION_DIR="/home/${SUDO_USER}/.config/fzf-tab-completion"
if [ -d "${FZF_PATH_COMPLETION_DIR}" ]; then
	echo -e "\n$(tput bold)-WARN:$(tput sgr0) fzf-tab-completion already installed!!!"
else
	git clone https://github.com/lincheney/fzf-tab-completion.git ${FZF_PATH_COMPLETION_DIR}
	echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) fzf-tab-completion installed"
fi

# Place zshrc config
rm -rf /home/${SUDO_USER}/.zshrc
rm -rf /home/${SUDO_USER}/Scripts
ln -s $(pwd)/bash/.zshrc /home/${SUDO_USER}/.zshrc
ln -s $(pwd)/scripts /home/${SUDO_USER}/Scripts
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) zsh config was linked to .zshrc"

# Place tmux config
rm -rf /home/${SUDO_USER}/.tmux*
ln -s $(pwd)/bash/.tmux.conf /home/${SUDO_USER}/.tmux.conf
git clone --quiet https://github.com/tmux-plugins/tpm /home/${SUDO_USER}/.tmux/plugins/tpm
chmod -R 777 /home/${SUDO_USER}/.tmux/plugins/
# /home/${SUDO_USER}/.tmux/plugins/tpm/bin/install_plugins
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) tmux config was linked to .tmux.conf"

# Check if XSessin File entry exists (so that chadwm appears in the session manager)
XSESSION_FILE="/usr/share/xsessions/chadwm.desktop"
if [ -f "${XSESSION_FILE}" ]; then
	echo -e "\n$(tput bold)-WARN:$(tput sgr0) ${XSESSION_FILE} already exists!!!"
else
	echo "[Desktop Entry]" >>${XSESSION_FILE}
	echo "Name=chadwm" >>${XSESSION_FILE}
	echo "Comment=dwm made beautiful" >>${XSESSION_FILE}
	echo "Exec=/home/${SUDO_USER}/.config/scripts/./run.sh" >>${XSESSION_FILE}
	echo "Type=Application" >>${XSESSION_FILE}

	echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) XSession file entry was created"
fi

# Build chadwm
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) Building chadwm... \n"
rm $(pwd)/chadwm/config.h
cd $(pwd)/chadwm
sudo make install >>/dev/null
cd ..

# Get Wallpapers
rm -rf /home/${SUDO_USER}/.config/wallpapers
git clone --quiet https://github.com/Gingeh/wallpapers.git /home/${SUDO_USER}/.config/wallpapers
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) Wallpapers were installed"

# Create Simulink for Hyprland and Hyprpaper config
rm -rf /home/${SUDO_USER}/.config/hypr
ln -s $(pwd)/hypr /home/${SUDO_USER}/.config/hypr
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) Hyprland and Hyprpaper configs were linked to .config"

# Place eww config
rm -rf /home/${SUDO_USER}/.config/eww
ln -s $(pwd)/eww /home/${SUDO_USER}/.config/eww
echo -e "\n$(tput bold)-CONFIG:$(tput sgr0) eww config was linked to .config"

echo -e "\n$(tput bold setaf 6)Installation done, enjoy!!!\n"

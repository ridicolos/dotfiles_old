#!/bin/bash

echo "Updating..."
sudo dnf update -y
echo "Done.."

echo ""

echo "Installing desktoptools..."
sudo dnf install -y ulauncher \
	stacer \
	gimp \
	yubioath-desktop.x86_64 \
	timeshift \
	gparted \
	gnome-tweaks \
	evolution \
	chromium \
	gparted \
	gnome-tweaks \
	transmission \
	keepassxc
echo "Done"

echo ""

echo "Installing terminaltools..."
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf install -y ranger \
	vim \
	neofetch \
	ncdu \
	trash-cli \
	htop \
	pgadmin3 \
	speedtest-cli \
	typespeed \
	awscli \
	terraform \
	bat \
	zsh
echo "Done"

echo ""

echo "Installing flatpacks..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub -y io.gitlab.librewolf-community \
	org.signal.Signal \
	com.bitwarden.desktop \
	com.teamspeak.TeamSpeak \
	com.discordapp.Discord \
	com.visualstudio.code \
	com.obsproject.Studio \
	io.dbeaver.DBeaverCommunity \
	org.videolan.VLC \
	org.remmina.Remmina \
	org.zotero.Zotero \
	com.github.Eloston.UngoogledChromium \
	com.spotify.Client \
	com.github.tchx84.Flatseal \
	belmoussaoui.Obfuscate \
	raspberrypi.rpi-imager \
	net.cozic.joplin_desktop
echo "Done"

echo ""

echo "Installing servers..."
sudo dnf install -y postgresql \
    postgresql-server \
	mariadb \
	@"Web Server"
echo "Done"





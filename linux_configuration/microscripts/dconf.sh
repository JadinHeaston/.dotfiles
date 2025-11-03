#!/bin/bash

## Installation

sudo apt install -y dconf-editor gnome-shell-extension-manager;
echo 'DCONF_EDIT: Install "Blur my Shell (aunetx)" via Extensions and set Sigma to 5 with brighness intensity to .35';

gsettings set org.gnome.mutter workspaces-only-on-primary ${DCONF_WORKSPACES_ONLY_ON_PRIMARY};
gsettings set org.gnome.settings-daemon.plugins.power idle-dim ${DCONF_IDLE_DIM};
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button ${DCONF_RESIZE_WINDOWS_WITH_RMB};
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste ${DCONF_ENABLE_PRIMARY_PASTE};

##### Desktop

gsettings set org.gnome.desktop.background picture-uri-dark file:///usr/share/backgrounds/Multiverse_by_Emanuele_Santoro.png;
gsettings set org.gnome.desktop.background picture-uri-light file:///usr/share/backgrounds/Multiverse_by_Emanuele_Santoro.png;
gnome-extensions disable ding@rastersoft.com; #Disable desktop icons.

##### Dock

gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size ${DCONF_DASH_MAX_ICON_SIZE};
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height ${DCONF_EXTEND_HEIGHT};
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor ${DCONF_MULTI_MONITOR};
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts ${DCONF_SHOW_MOUNTS};
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network ${DCONF_SHOW_MOUNTS_NETWORK};
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash ${DCONF_SHOW_TRASH};
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed ${DCONF_DOCK_FIXED};
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position ${DCONF_DOCK_POSITION};
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show ${DCONF_REQUIRE_PRESSURE_TO_SHOW};

##### Taskbar

gsettings set org.gnome.desktop.interface clock-show-seconds ${DCONF_CLOCK_SHOW_SECONDS};
gsettings set org.gnome.desktop.interface clock-format ${DCONF_CLOCK_FORMAT};
gsettings set org.gnome.desktop.interface clock-show-weekday ${DCONF_CLOCK_SHOW_WEEKDAY};
gsettings set org.gnome.desktop.interface show-battery-percentage ${DCONF_SHOW_BATTERY_PERCENTAGE};

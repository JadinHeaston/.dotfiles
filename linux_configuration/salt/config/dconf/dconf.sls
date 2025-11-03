# Install required packages
{{ sls }}:
  pkg.installed:
    - pkgs:
      - dconf-editor
      - gnome-shell-extension-manager

# Set dconf-editor settings via gsettings
{{ sls }}_workspace_only_on_primary:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.mutter workspaces-only-on-primary true
    - unless: gsettings get org.gnome.mutter workspaces-only-on-primary | grep "true"

{{ sls }}_idle_dim:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
    - unless: gsettings get org.gnome.settings-daemon.plugins.power idle-dim | grep "false"

{{ sls }}_resize_with_rmb:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
    - unless: gsettings get org.gnome.desktop.wm.preferences resize-with-right-button | grep "true"

{{ sls }}_enable_primary_paste:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
    - unless: gsettings get org.gnome.desktop.interface gtk-enable-primary-paste | grep "false"

# Set desktop background image
{{ sls }}_background_image:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.desktop.background picture-uri-dark file:///usr/share/backgrounds/Multiverse_by_Emanuele_Santoro.png
    - unless: gsettings get org.gnome.desktop.background picture-uri-dark | grep "file:///usr/share/backgrounds/Multiverse_by_Emanuele_Santoro.png"

# Disable desktop icons if required
disable_desktop_icons:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gnome-extensions disable ding@rastersoft.com

# Set Dash to Dock settings
{{ sls }}_dash_max_icon_size:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock dash-max-icon-size | grep "24"

{{ sls }}_dash_extend_height:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock extend-height | grep "false"

{{ sls }}_dash_multi_monitor:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor false
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock multi-monitor | grep "false"

{{ sls }}_dash_show_mounts:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock show-mounts | grep "false"

{{ sls }}_dash_show_mounts_network:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network false
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock show-mounts-network | grep "false"

{{ sls }}_dash_show_trash:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock show-trash | grep "false"

{{ sls }}_dash_dock_fixed:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock dock-fixed | grep "false"

{{ sls }}_dash_dock_position:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock dock-position | grep "BOTTOM"

{{ sls }}_dash_require_pressure_to_show:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false
    - unless: gsettings get org.gnome.shell.extensions.dash-to-dock require-pressure-to-show | grep "false"

# Set Taskbar settings
{{ sls }}_clock_show_seconds:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.desktop.interface clock-show-seconds true
    - unless: gsettings get org.gnome.desktop.interface clock-show-seconds | grep "true"

{{ sls }}_clock_format:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.desktop.interface clock-format "12h"
    - unless: gsettings get org.gnome.desktop.interface clock-format | grep "12h"

{{ sls }}_clock_show_weekday:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.desktop.interface clock-show-weekday true
    - unless: gsettings get org.gnome.desktop.interface clock-show-weekday | grep "true"

{{ sls }}_show_battery_percentage:
  cmd.run:
    - name: export DISPLAY=:0 && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && gsettings set org.gnome.desktop.interface show-battery-percentage true
    - unless: gsettings get org.gnome.desktop.interface show-battery-percentage | grep "true"


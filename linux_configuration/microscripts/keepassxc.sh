#!/bin/bash

## Enabling auto-type

### Enabling WebDav support

sudo apt install -y davfs2
#sudo dpkg-reconfigure davfs2
sudo mkdir -p "$KEEPASS_WEBDAV_MOUNT_PATH"
sudo mkdir ~/.davfs2
sudo touch ~/.davfs2/secrets
sudo chown $USER:$USER -R ~/.davfs2
echo "$KEEPASS_WEBDAV_URL	$KEEPASS_WEBDAV_USERNAME	$KEEPASS_WEBDAV_PASSWORD" >> ~/.davfs2/secrets #Tab delimited (# act as comments, escape them)
sudo chmod 600 ~/.davfs2/secrets
sudo su -c "echo \"$KEEPASS_WEBDAV_URL \"$KEEPASS_WEBDAV_MOUNT_PATH\" davfs user,_netdev,auto,file_mode=600,dir_mode=700 0 1\" >> /etc/fstab"
sudo usermod -a -G davfs2 $USER
sudo systemctl enable NetworkManager-wait-online.service #Disable for a potential boot improvement.
touch ~/.bash_profile
echo "mount \"$KEEPASS_WEBDAV_MOUNT_PATH\"" > ~/.bash_profile #Running on login.
mount "$KEEPASS_WEBDAV_MOUNT_PATH"

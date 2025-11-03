rm -rf /srv/salt/
cp -rf . /srv/salt/

cp -f master /etc/salt/master
cp -f minion /etc/salt/minion

chown -R root:root /srv/salt/ /etc/salt/master /etc/salt/minion

service salt-master stop
service salt-minion stop

service salt-master start
service salt-minion start

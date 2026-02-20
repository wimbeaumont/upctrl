# assume elpc2 digpr is mounted on /home/digpr/elpc2 
#run as user digpr  in home directory 
# first user after pi and digpr get user id 1002 gid 1002 
#sudo adduser digpr2 

#user should have the same uid gui as on elpc2 
sudo groupadd -g 1004 digpr1
sudo adduser --uid 1003 --gid  1004  digpr1

cp elpc2/github/upctrl/scripts/init_and_mount.sh /tmp

DIGPRNR='digpr2'

sudo usermod -aG sudo $DIGPRNR
sudo usermod  -aG gpio $DIGPRNR
sudo usermod  -aG i2c $DIGPRNR
#add some files 
sudo mkdir /home/$DIGPRNR/.ssh
sudo chown $DIGPRNR:$DIGPRNR  /home/$DIGPRNR/.ssh
sudo mkdir /home/$DIGPRNR/elpc2
sudo chown $DIGPRNR:$DIGPRNR  /home/$DIGPRNR/elpc2
sudo chmod og-rx /home/$DIGPRNR/.ssh
sudo  cp ./.ssh/authorized_keys /home/$DIGPRNR/.ssh/
sudo chown $DIGPRNR:$DIGPRNR  /home/$DIGPRNR/.ssh/authorized_keys 
sudo chmod og-rx /home/$DIGPRNR/.ssh/authorized_keys 

sudo cp /tmp/init_and_mount.sh /home/$DIGPRNR/
sudo chown $DIGPRNR:$DIGPRNR  /home/$DIGPRNR/init_and_mount.sh
sudo chmod +x /home/$DIGPRNR/init_and_mount.sh

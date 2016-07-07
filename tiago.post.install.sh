
echo "##################################"
echo "#                                #"
echo "#          updating apt          #"
echo "#                                #"
echo "##################################"

apt-get update

echo "##################################"
echo "#                                #"
echo "#        upgrading system        #"
echo "#                                #"
echo "##################################"

apt-get upgrade
apt-get dist-upgrade

echo "##################################"
echo "#                                #"
echo "#       installing packages      #"
echo "#                                #"
echo "##################################"

apt-get install git -y
apt-get install vim -y
apt-get install bzip2 -y
apt-get install make -y
apt-get install xorg xinit -y
apt-get install i3 suckless-tools -y
apt-get install sudo -y
apt-get install linuxlogo -y
apt-get install zathura -y
apt-get install apt-transport-https -y
apt-get install libasound2 alsa-base alsa-utils alsa-oss alsamixergui -y


echo "##################################"
echo "#                                #"
echo "#     installing Oera Browser    #"
echo "#                                #"
echo "##################################"

#wget https://ftp.opera.com/pub/opera/desktop/38.0.2220.41/linux/opera-stable_38.0.2220.41_i386.deb
wget https://ftp.opera.com/pub/opera/desktop/38.0.2220.41/linux/opera-stable_38.0.2220.41_.amd64.deb
dpkg -i opera*

echo "##################################"
echo "#                                #"
echo "#          cleaning apt          #"
echo "#                                #"
echo "##################################"

apt-get autoclean
apt-get purge
apt-get autoremove


echo "##################################"
echo "#                                #"
echo "# setting up configuration files #"
echo "#                                #"
echo "##################################"

echo "[[ -z $ Display && $XDG_VTNR -eq 1 ]] && exec startx" >> /etc/profile

echo "##################################"
echo "#                                #"
echo "#     creating user for tiago    #"
echo "#                                #"
echo "##################################"

deluser tiago
adduser tiago
adduser tiago sudo

echo "##################################"
echo "#                                #"
echo "#            FINISHED            #"
echo "#                                #"
echo "##################################"


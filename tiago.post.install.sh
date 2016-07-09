
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

apt-get install git vim bzip2 make i3 suckless-tools sudo linuxlogo zathura apt-transport-https libasound2 alsa-base alsa-utils alsa-oss alsamixergui xserver-xorg-video-all -y
apt-get install xorg -y

echo "##################################"
echo "#                                #"
echo "#    installing Opera Browser    #"
echo "#                                #"
echo "##################################"

#wget https://ftp.opera.com/pub/opera/desktop/38.0.2220.41/linux/opera-stable_38.0.2220.41_i386.deb
wget https://ftp.opera.com/pub/opera/desktop/38.0.2220.41/linux/opera-stable_38.0.2220.41_amd64.deb
dpkg -i opera*
apt-get -f install -y
dpkg -i opera*
rm opera*

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

echo "[[ -z \$Display && \$XDG_VTNR -eq 1 ]] && exec startx" >> /etc/profile

echo "##################################"
echo "#                                #"
echo "#     creating user for tiago    #"
echo "#                                #"
echo "##################################"

deluser tiago --remove-home
adduser tiago
adduser tiago sudo

echo "##################################"
echo "#                                #"
echo "#            FINISHED            #"
echo "#                                #"
echo "##################################"


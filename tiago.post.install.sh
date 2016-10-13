
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
apt-get install sudo -y
apt-get install linuxlogo -y
apt-get install zathura pandoc -y
apt-get install apt-transport-https -y
apt-get install libasound2 alsa-base alsa-utils alsa-oss alsamixergui -y
apt-get install xserver-xorg-video-all -y
apt-get install xorg -y
apt-get install i3 suckless-tools -y

echo "##################################"
echo "#                                #"
echo "#    installing Opera Browser    #"
echo "#                                #"
echo "##################################"

wget https://ftp.opera.com/pub/opera/desktop/40.0.2308.81/linux/opera-stable_40.0.2308.81_i386.deb
wget https://ftp.opera.com/pub/opera/desktop/40.0.2308.81/linux/opera-stable_40.0.2308.81_amd64.deb
dpkg -i opera*
apt-get -f install -y
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


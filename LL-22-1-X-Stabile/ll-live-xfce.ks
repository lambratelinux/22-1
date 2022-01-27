# Lambrate Linux  
# https://www.lambratelinux.org
# mailto:info@lambratelinux.org
# Maintainer(s): Sergio Agnes (aka idraulico)
# email: idraulico.py@gmail.com
# Progetto: Lambrate Linux Xfce
# kickstart file: ll-live-xfce.ks

%include /home/idraulico/LambrateLinux-devel/LL-22-1-X-Stabile/ll-live-base.ks
%include /home/idraulico/LambrateLinux-devel/LL-22-1-X-Stabile/ll-xfce-common.ks

part / --size=8192

%post
# xfce configuration

# create /etc/sysconfig/desktop (needed for installation)

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/startxfce4
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

# set up lightdm autologin
############# INIZIO ############## LAMBRATE LINUX ##########################
## AI PROSSIMI DUE sed NORMALMENTE SONO DA TOGLIERE I COMMENTI IN MODO DA ESEGUIRE L'AUTOLOGIN
## INOLTRE ATTENZIONE CHE L'UTENTE E' LAMBRETTA e NON "LIVEUSER"
sed -i 's/^#autologin-user=.*/autologin-user=lambretta/' /etc/lightdm/lightdm.conf
sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
############# FINE ############## LAMBRATE LINUX ##########################
#sed -i 's/^#show-language-selector=.*/show-language-selector=true/' /etc/lightdm/lightdm-gtk-greeter.conf

# set xfce4 as default session, otherwise login will fail
sed -i 's/^#user-session=.*/user-session=xfce4/' /etc/lightdm/lightdm.conf

######### Al login colore background e immagine di sfondo
cat > /etc/lightdm/slick-greeter.conf << FOE
[Greeter]
background-color=#539a23
background=/usr/share/backgrounds/default.png
FOE

mkdir -p /home/lambretta/.config/xfce4

cat > /home/lambretta/.config/xfce4/helpers.rc << FOE
MailReader=claws-mail
FileManager=Thunar
WebBrowser=firefox
FOE

# disable screensaver locking (#674410)
cat >> /home/lambretta/.xscreensaver << FOE
mode:           off
lock:           False
dpmsEnabled:    False
FOE

# deactivate xfconf-migration (#683161)
rm -f /etc/xdg/autostart/xfconf-migration-4.6.desktop || :

# deactivate xfce4-panel first-run dialog (#693569)
mkdir -p /home/lambretta/.config/xfce4/xfconf/xfce-perchannel-xml
cp /etc/xdg/xfce4/panel/default.xml /home/lambretta/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

# no updater applet in live environment
rm -f /etc/xdg/autostart/org.mageia.dnfdragora-updater.desktop

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/lambretta/Desktop
cp /usr/share/applications/liveinst.desktop /home/lambretta/Desktop

# and mark it as executable
chmod +x /home/lambretta/Desktop/liveinst.desktop

# this goes at the end after all other changes. 
chown -R lambretta:lambretta /home/lambretta
restorecon -R /home/lambretta

#### Per ERRORE al boot di "dracut-pre-pivot": /etc/multipath.conf does not exist, blacklisting all devices. Si ovvia con: /sbin/mpathconf --enable

/sbin/mpathconf --enable
cat > /etc/multipath.conf << FOE

blacklist {
}

defaults {
}
FOE

EOF

%end



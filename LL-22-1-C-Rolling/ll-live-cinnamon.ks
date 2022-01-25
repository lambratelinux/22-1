# Lambrate Linux  
# https://www.lambratelinux.org
# mailto:info@lambratelinux.org
# Maintainer(s): Sergio Agnes (aka idraulico)
# email: idraulico.py@gmail.com
# Progetto: Lambrate Linux Cinnamon
# kickstart file: ll-live-cinnamon.ks

%include /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/ll-live-base.ks
%include /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/ll-cinnamon-common.ks

part / --size=8192

%post
# cinnamon configuration

# create /etc/sysconfig/desktop (needed for installation)

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/cinnamon-session
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

# set up lightdm autologin
############# INIZIO ############## LAMBRATE LINUX ##########################
## AI PROSSIMI DUE sed NORMALMENTE SONO DA TOGLIERE I COMMENTI IN MODO DA ESEGUIRE L'AUTOLOGIN
## INOLTRE ATTENZIONE CHE L'UTENTE E' LAMBRETTA e NON "LIVEUSER"
#sed -i 's/^#autologin-user=.*/autologin-user=liveuser/' /etc/lightdm/lightdm.conf
#sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
############# FINE ############## LAMBRATE LINUX ##########################
#sed -i 's/^#show-language-selector=.*/show-language-selector=true/' /etc/lightdm/lightdm-gtk-greeter.conf

# set Cinnamon as default session, otherwise login will fail
sed -i 's/^#user-session=.*/user-session=cinnamon/' /etc/lightdm/lightdm.conf

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

EOF

%end



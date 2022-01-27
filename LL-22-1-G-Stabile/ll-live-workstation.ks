# Lambrate Linux  
# https://www.lambratelinux.org
# mailto:info@lambratelinux.org
# Maintainer(s): Sergio Agnes (aka idraulico)
# email: idraulico.py@gmail.com
# Progetto: Lambrate Linux Workstation
# kickstart file: ll-live-base.ks
# incluso in: ll-live-workstation.ks

%include /home/idraulico/LambrateLinux-devel/LL-22-1-G-Stabile/ll-live-base.ks
%include /home/idraulico/LambrateLinux-devel/LL-22-1-G-Stabile/ll-workstation-common.ks
#
# Disable this for now as packagekit is causing compose failures
# by leaving a gpg-agent around holding /dev/null open.
#
#include /home/idraulico/LambrateLinux-devel/LL-22-1-G-Stabile/snippets/packagekit-cached-metadata.ks

#part / --size 6656
part / --size 8192

%post

cat >> /etc/rc.d/init.d/livesys << EOF

# disable gnome-software automatically downloading updates
cat >> /usr/share/glib-2.0/schemas/org.gnome.software.gschema.override << FOE
[org.gnome.software]
download-updates=false
FOE

# don't autostart gnome-software session service
rm -f /etc/xdg/autostart/gnome-software-service.desktop

# disable the gnome-software shell search provider
cat >> /usr/share/gnome-shell/search-providers/org.gnome.Software-search-provider.ini << FOE
DefaultDisabled=true
FOE

# don't run gnome-initial-setup
mkdir ~lambretta/.config
touch ~lambretta/.config/gnome-initial-setup-done

# suppress anaconda spokes redundant with gnome-initial-setup
cat >> /etc/sysconfig/anaconda << FOE
[NetworkSpoke]
visited=1

[PasswordSpoke]
visited=1

[UserSpoke]
visited=1
FOE

#### Per ERRORE al boot di "dracut-pre-pivot": /etc/multipath.conf does not exist, blacklisting all devices. Si ovvia con: /sbin/mpathconf --enable

#/sbin/mpathconf --enable
#cat > /etc/multipath.conf << FOE

#blacklist {
#}

#defaults {
#}
#FOE

# make the installer show up
if [ -f /usr/share/applications/liveinst.desktop ]; then
  # Show harddisk install in shell dash
  sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop ""
  # need to move it to anaconda.desktop to make shell happy
  mv /usr/share/applications/liveinst.desktop /usr/share/applications/anaconda.desktop

  cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override << FOE
[org.gnome.shell]
favorite-apps=['firefox.desktop', 'evolution.desktop', 'rhythmbox.desktop', 'shotwell.desktop', 'org.gnome.Nautilus.desktop', 'anaconda.desktop']
FOE

  ################ NO BENVENUTI IN FEDORA
  # Make the welcome screen show up
  #if [ -f /usr/share/anaconda/gnome/fedora-welcome.desktop ]; then
  #  mkdir -p ~lambretta/.config/autostart
  #  cp /usr/share/anaconda/gnome/fedora-welcome.desktop /usr/share/applications/
  #  cp /usr/share/anaconda/gnome/fedora-welcome.desktop ~lambretta/.config/autostart/
  #fi

  # Copy Anaconda branding in place
  if [ -d /usr/share/lorax/product/usr/share/anaconda ]; then
    cp -a /usr/share/lorax/product/* /
  fi
fi

# rebuild schema cache with any overrides we installed
glib-compile-schemas /usr/share/glib-2.0/schemas

# set up auto-login
cat > /etc/gdm/custom.conf << FOE
[daemon]
AutomaticLoginEnable=False
AutomaticLogin=lambretta
FOE

# Turn off PackageKit-command-not-found while uninstalled
if [ -f /etc/PackageKit/CommandNotFound.conf ]; then
  sed -i -e 's/^SoftwareSourceSearch=true/SoftwareSourceSearch=false/' /etc/PackageKit/CommandNotFound.conf
fi

# make sure to set the right permissions and selinux contexts
chown -R lambretta:lambretta /home/lambretta
restorecon -R /home/lambretta/

EOF

%end

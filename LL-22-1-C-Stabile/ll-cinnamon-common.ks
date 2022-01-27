# Lambrate Linux  
# https://www.lambratelinux.org
# mailto:info@lambratelinux.org
# Maintainer(s): Sergio Agnes (aka idraulico)
# email: idraulico.py@gmail.com
# Progetto: Lambrate Linux Cinnamon
# kickstart file: ll-cinnamon-common.ks
# incluso in: ll-live-cinnamon.ks

%packages

### DE utilizzato
@cinnamon-desktop

### App necessarie
@firefox
@libreoffice
#-@workstation-product

#lightdm
#lightdm-gobject
#lightdm-gtk
#lightdm-qt5
#lightdm-settings
#slick-greeter-cinnamon
#slick-greeter

# Exclude unwanted packages from @anaconda-tools group
-gfs2-utils
-reiserfs-utils

#################### pacchetti esclusi dall'idraulico :))
# Exclude unwanted packages from @workstation-product group (Lambrate Linux è una generic-release)
-fedora-release-workstation
-fedora-workstation-backgrounds
-fedora-chromium-config
-xawtv
### Cinnamon vuole il pacchetto "gnome-backgrounds" quindi non si può togliere
#-gnome-backgrounds

#-fedora-release-identity-basic
#-fedora-release-common
#-fedora-release
#-fedora-release-identity-workstation
#-fedora-workstation-backgrounds
fedora-logos
fedora-logos-httpd

# Exclude unwanted packages from @gnome group
-gnome-tour
-fedora-bookmarks

#################### pacchetti per Lambrate Linux aggiunti a quelli standard
#initial-setup
#net-tools  #per implementare ifconfig e iwconfig
#firewall-config
google-chrome-stable
#code
#cockpit

#################### Pacchetti per generare il sistema LAMBRATE LINUX ##############
#-generic-release
#-generic-release-common
#-generic-release-notes
LambrateLinux-release
#LambrateLinux-release-common   #è installato automaticamente da LambrateLinux-release
#-LambrateLinux-release-notes

desktop-backgrounds-basic
desktop-backgrounds-compat
desktop-backgrounds-gnome
desktop-backgrounds-waves
#-gnome-backgrounds IL PACCHETTO CINNAMON HA BISOGNO DI QUESTO PACCHETTO

f35-backgrounds-base
f35-backgrounds-extras-base
f35-backgrounds-gnome
f35-backgrounds-extras-gnome

plymouth
plymouth-core-libs
plymouth-scripts
plymouth-graphics-libs
plymouth-plugin-label
plymouth-plugin-two-step
plymouth-theme-spinner
plymouth-system-theme

#generic-logos

###App comuni aggiunte
gnome-screenshot
beesu
gedit 
gparted
htop
lshw 
gpm
#gnote
claws-mail 
pluma 
#sound-juicer
#grip
#blender
#inkscape
gimp
#kmahjongg
#crack-attack
#kpat
#pinball
aisleriot
#opera-stable

###App non necessarie aggiunte
##curl
##wget
##thunar
##guake

###Driver, daemon aggiunti
#akmods
#akmod-wl
#kernel-devel

%end

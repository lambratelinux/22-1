# Lambrate Linux  
# https://www.lambratelinux.org
# mailto:info@lambratelinux.org
# Maintainer(s): Sergio Agnes (aka idraulico)
# email: idraulico.py@gmail.com
# Progetto: Lambrate Linux Workstation
# kickstart file: ll-workstation-common.ks
# incluso in: ll-live-workstation.ks

%packages

# Exclude unwanted groups that fedora-live-base.ks pulls in
#-@dial-up
#-@input-methods
#-@standard

# Make sure to sync any additions / removals done here with
# workstation-product-environment in comps

### DE utilizzato
@gnome-desktop

### App necessarie
@firefox
@libreoffice
#-@workstation-product

# Exclude unwanted packages from @anaconda-tools group
-gfs2-utils
-reiserfs-utils

#################### pacchetti esclusi dall'idraulico :))
# Exclude unwanted packages from @workstation-product group (Lambrate Linux è una generic-release)
-fedora-release-workstation
-fedora-workstation-backgrounds
-fedora-chromium-config
-gnome-backgrounds
gnome-control-center

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
code
cockpit

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
gnome-tweaks
beesu
gedit 
gparted
htop
lshw 
gpm
gnote
claws-mail 
pluma 
sound-juicer
#grip
mpv
#blender
#inkscape
gimp
kmahjongg
crack-attack
kpat
#pinball
aisleriot
#opera-stable

###App speciali aggiunte
filezilla
libdvdcss
ffmpeg 
x264
x265
twolame
libmatroska

##curl
##wget

###Driver, daemon aggiunti
#akmods
#akmod-wl
#kernel-devel

%end

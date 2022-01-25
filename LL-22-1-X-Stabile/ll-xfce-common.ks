# Lambrate Linux  
# https://www.lambratelinux.org
# mailto:info@lambratelinux.org
# Maintainer(s): Sergio Agnes (aka idraulico)
# email: idraulico.py@gmail.com
# Progetto: Lambrate Linux Workstation
# kickstart file: ll-xfce-common.ks
# incluso in: ll-live-xfce.ks

%packages

# Exclude unwanted groups that fedora-live-base.ks pulls in
#-@dial-up
#-@input-methods
#-@standard

# Make sure to sync any additions / removals done here with
# workstation-product-environment in comps

#################### DE utilizzato
@xfce-desktop
@xfce-apps
@xfce-extra-plugins
@xfce-media
@xfce-office

# unlock default keyring. FIXME: Should probably be done in comps
gnome-keyring-pam
# Admin tools are handy to have
@admin-tools
# Add some screensavers, people seem to like them
# Note that blank is still default.
xscreensaver-extras

system-config-printer

################### App necessarie
@firefox
@libreoffice
lightdm-settings
#-@workstation-product

# Exclude unwanted packages from @anaconda-tools group
-gfs2-utils
-reiserfs-utils

#################### pacchetti esclusi dall'idraulico :))
# Exclude unwanted packages from @workstation-product group (Lambrate Linux è una generic-release)
-fedora-release-workstation
-fedora-workstation-backgrounds
-fedora-chromium-config
### Cinnamon vuole il pacchetto "gnome-backgrounds" quindi non si può togliere
#-gnome-backgrounds

#-fedora-release-identity-basic
#-fedora-release-common
#-fedora-release
#-fedora-release-identity-workstation
#-fedora-workstation-backgrounds
fedora-logos
fedora-logos-httpd
-plymouth-system-theme

# Exclude unwanted packages from @gnome group
-gnome-tour
-fedora-bookmarks

#################### pacchetti per Lambrate Linux aggiunti a quelli standard
#fpaste
#initial-setup
#net-tools  #per implementare ifconfig e iwconfig
#firewall-config
#opera-stable
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
xfce4-screenshooter
xfce4-screenshooter-plugin
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

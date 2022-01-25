#!/bin/bash
sudo setenforce 0
#21 Novembre 2021
#--location LOCATION                        location of iso directory tree with initrd.img and vmlinuz.
#--lorax-templates LORAX_TEMPLATES          Path to mako templates for lorax
#--tmp                                      Top level temporary directory           Default: /var/tmp

#sudo livemedia-creator --ks /home/idraulico/LambrateLinux2021/LL-35/fedora-live-cinnamon.ks \
#--tmp /home/idraulico/LambrateLinux2021/LL-35/tmp \
#--lorax-templates /home/idraulico/LambrateLinux2021/LL-35/tmp \
#--resultdir /home/idraulico/LambrateLinux2021/LL-35/lmc \
#--project fedora-35 --make-iso --volid fedora-35 --iso-only --iso-name fedora-35.iso --releasever 35 --macboot --no-virt

sudo livemedia-creator --ks /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/ll-live-cinnamon.ks \
--tmp /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/tmp \
--resultdir /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/lmc \
--project LL-22-1-C-Rolling-Live --make-iso --volid LL-22-1-C-Rolling-Live --iso-only --iso-name LL-22-1-C-Rolling-Live.iso --releasever 36 --macboot --no-virt


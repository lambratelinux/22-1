# 22-1
### Lambrate Linux kickstart files
- Version Stable from Fedora 35
- Version Rolling from Fedora Rawhide

### Howto create Lambrate Linux Stable
edit file ll-22-1-livemedia-creator.sh with:

#!/bin/bash
sudo setenforce 0
sudo livemedia-creator --ks /home/idraulico/LambrateLinux-devel/LL-22-1-C-Stabile/ll-live-cinnamon.ks \
--tmp /home/idraulico/LambrateLinux-devel/LL-22-1-C-Stabile/tmp \
--resultdir /home/idraulico/LambrateLinux-devel/LL-22-1-C-Stabile/lmc \
--project LL-22-1-C-Stabile-Live --make-iso --volid LL-22-1-C-Stabile-Live --iso-only --iso-name LL-22-1-C-Stabile-Live.iso --releasever 35 --macboot --no-virt

### Howto create Lambrate Linux Rolling
edit file ll-22-1-livemedia-creator.sh with:

#!/bin/bash
sudo setenforce 0
sudo livemedia-creator --ks /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/ll-live-cinnamon.ks \
--tmp /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/tmp \
--resultdir /home/idraulico/LambrateLinux-devel/LL-22-1-C-Rolling/lmc \
--project LL-22-1-C-Rolling-Live --make-iso --volid LL-22-1-C-Rolling-Live --iso-only --iso-name LL-22-1-C-Rolling-Live.iso --releasever 36 --macboot --no-virt

# 10things_arch

Check your current kernel:
umane -r

# 1. Install an LTS kernel and reconfigure grub:
sudo pacman -S linux-lts
sudo grub-mkconfig -o /boot/grub/grub.cfg

You may also install linux-lts-headers.
Reboot and check which kernel is in use with uname -r.

Remove non-lts kernel
sudo pacman -Rs linux

# 2. Install Microcode


For intel processors with grub boot loader:
sudo pacman -S intel-ucode
sudo grub-mkconfig -o /boot/grub/grub.cfg

For AMD processors install linux-firmware package.

# 3. Disable GRUB delay

Add the following to /etc/default/grub:
achieve the fastest possible boot:
GRUB_FORCE_HIDDEN_MENU="true"

Then put file 31_hold_shift to /etc/grub.d/.
Download 31_hold_shift https://goo.gl/nac6Kp

Make it executable, and regenerate the grub configuration:
sudo chmod a+x /etc/grub.d/31_hold_shift
sudo grub-mkconfig -o /boot/grub/grub.cfg

# 4. Install some key packages

sudo pacman -S adobe-source-sans-pro-fonts aspell-en enchant gst-libav gst-plugins-good hunspell-en icedtea-web jre8-openjdk languagetool libmythes mythes-en pkgstats ttf-anonymous-pro ttf-bitstream-vera ttf-dejavu ttf-droid ttf-gentium ttf-liberation ttf-ubuntu-font-family

# 5. Set up firewall

Install ufw:
sudo pacman -S ufw

Enable it.
sudo ufw enable 

Check its status:
sudo ufw status verbose

Enable the start-up with the system:
sudo systemctl enable ufw.service

Reboot and check the status again. It should be active.

# 6. Encrypt your home directory

Logged out. Switch to a console with Ctrl+Alt+F2. Login as a root and check that your user own no processes:
ps -U username 

Install the necessary applications: 
sudo pacman -S rsync lsof ecryptfs-utils

Then encrypt your home directory: 
modprobe ecryptfs
ecryptfs-migrate-home -u username

Mount your encrypted home.
ecryptfs-mount-private

Unwrap the passphrase and save it somewhere where only you can access it.
ecryptfs-unwrap-passphrase

Run
ls .ecryptfs

Edit /etc/pam.d/system-auth:

After the line "auth required pam_unix.so" add: 
auth required pam_ecryptfs.so unwrap

Above the line "password required pam_unix.so" insert: 
password optional pam_ecryptfs.so

After the line "session required pam_unix.so" add: 
session optional pam_ecryptfs.so unwrap

Reboot and make sure that you can login to your desktop

# 7. Remove orphans

sudo pacman -Rns $(pacman -Qtdq)

# 8. Optimize pacman's database access speeds

sudo pacman-optimize

# 9. Check for errors

sudo systemctl --failed
sudo journalctl -p 3 -xb


# 10. Backup the system

sudo rsync -aAXvP --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/lost+found --exclude=/home/.ecryptfs / /mnt/backupDestination/

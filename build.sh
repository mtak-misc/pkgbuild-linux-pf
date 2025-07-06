#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

cd ./linux-pf  ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" env KBUILD_X86_64_ISA_LEVEL=2 makepkg --noconfirm -sc"

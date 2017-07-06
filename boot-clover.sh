#!/bin/bash

qemu-system-x86_64 -enable-kvm -m 3072 -cpu Penryn,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on \
	  -machine pc-q35-2.4 \
	  -smp 4,cores=2 \
	  -usb -device usb-kbd -device usb-mouse \
	  -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \
	  -drive if=pflash,format=raw,readonly,file=OVMF_CODE-pure-efi.fd \
	  -drive if=pflash,format=raw,file=OVMF_VARS-pure-efi.fd \
	  -smbios type=2 \
	  -device ich9-intel-hda -device hda-duplex \
	  -device ide-drive,bus=ide.2,drive=MacHDD \
	  -drive id=MacHDD,if=none,file=./mac_hdd.img \
	  -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
	  -monitor stdio \
	  -device ide-drive,bus=ide.0,drive=MacDVD \
	  -drive id=MacDVD,if=none,snapshot=on,file=./'Install_macOS_10.12.5_Sierra.iso'
	  # -vnc 0.0.0.0:0 -k en-us \
	  # -redir tcp:5901::5900 \
	  # -netdev user,id=hub0port0 -device e1000-82545em,netdev=hub0port0,id=mac_vnet0 \

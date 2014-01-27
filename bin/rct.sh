#!/bin/bash
echo "Mounting ISO to /media/cdrom"
sudo mount -o loop -t iso9660 /home/Media/Games/1.\ RollerCoaster\ Tycoon\ Original/Patch/RCT_Original.iso /media/cdrom/

#echo "Starting Wine"
#wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Hasbro\ Interactive/RollerCoaster\ Tycoon/rct.exe

#echo "Unmounting ISO"
#sudo umount /media/cdrom/

# debian-install

```
git clone https://github.com/alls-cpp/debian-install
cd debian-install
sudo ./install.sh
```

* For the notification of low battery, on terminal
```
crontab -e
```
and append
```
DISPLAY=:0
*/2 * * * * /home/alls/scripts/i3batwarn.sh
```
substitute alls and 1000 respectively with user's name and UID, you can get it with
```
alls@debian:~$ id
uid=1000(alls) gid=1000(alls) groups=1000(alls),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),100(users),106(netdev),110(bluetooth)```

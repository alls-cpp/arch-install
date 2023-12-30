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

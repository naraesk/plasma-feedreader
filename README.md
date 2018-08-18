# Plasma Feedreader

This is a simple plasma applet for KDE Plasma 5 which provides a system tray icon for [Feedreader](https://jangernert.github.io/FeedReader/).


### Supported Features
* start service (`sudo systemctl start SERVICE`)
* stop service (`sudo systemctl stop SERVICE`)
* updates automatically if status changed externally
* system units and user units (--user)

### Installation
```
$ mkdir biuld
$ cd build
$ cmake -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ../
$ make
$ sudo make install
$ kquitapp5 plasmashell
$ plasmashell
```

For Arch Linux there is a package available via [AUR](https://aur.archlinux.org/packages/plasma5-applets-feedreader/). 
Feedreader must be installed!

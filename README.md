# Genshin Sddm Theme

An animated genshin sddm-theme, comes with animated background
implemented changing backgrounds for the time of day. 
(will be added in the future)With every login-session,new wallpaper
will be shown based on the time on your OS. 

![](preview/2.png)
## Features

You can change almost all the colors within the 'theme.conf' file.More color options will be added in the future

- [x] <b>Animated Background</b>:

    Animated Background that goes on infinite loop.

- [x] <b>Login Menu</b>:

    One by one replica of genshins login menu.

- [x] <b>Power Menu</b>:
      
    Ability to sleep,shut-down or restart the os.

- [x] <b>Session Menu</b>:
      
    Ability to choose a session

- [ ] <b>Date&Time Menu</b>:
      
    Ability to see date and time on main meu

- [ ] <b>Door Animation</b>

    Will be avalible soon

- [ ] <b>Loading Animation</b>

    Will be avalible soon


- [ ] <b>Custom Grub and plymouth theme</b>

    Will be avalible soon

- [ ] <b>Variable Animations for different time of the day</b>:
      
    Will be avalible soon

- [ ] <b>Install Script</b>:
      
    Will be avalible soon






## Issues and Contribution

If you would like to contribute to this repo please do so by creating a PR. I am open to suggestions.


## Dependencies

Install sddm(Simple Desktop Display Manager).You also need QT5 which includes Qt Quick Controls 2, Qt Graphical Effects, Qt SVG, Qt Quick Layouts with version 5.11 or new.To do so 


For **Arch** based distros using **pacman**
(Obarun/Artix/Manjaro/KaOS/Chakra etc.)
```bash
sudo pacman -S --needed sddm
qt5‑graphicaleffects
qt5‑quickcontrols2
qt5‑svg
```
For **Debian** based distros using **apt**
(Ubuntu/Kubuntu/Kali/Neon/antiX etc.)
```bash
sudo apt install ‑‑no‑install‑recommends
sddm
qml‑module‑qtquick‑layouts
qml‑module‑qtgraphicaleffects
qml‑module‑qtquick‑controls2
libqt5svg5
```


## Procedure to Test

Follow the below steps to test it:

To test it before use you need to install this repo and copy it to your sddm themes folder.


In order to do this:


For Arch based distros:
```bash
cd
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
sudo cp -r /genshin-sddm-theme/ /usr/share/sddm/themes/
```
For Debian based distros:
```bash
cd
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
sudo cp -r genshin-sddm-theme /usr/share/sddm/themes/
```
After that install the background file.(700+Mb for high-bitrate 1080p lossles video)


[Google Drive](https://drive.google.com/file/d/19Z3NEZn-dg8KSQkk1vRF4KmI5S7ztSeP/view?usp=sharing)


Then copy the downloaded video to your theme folder.In order to do this first cd to your downloads folder.Then
```bash
sudo cp -r 1.mp4 /usr/share/sddm/themes/genshin-sddm-theme
```

I HIGHLY RECOMMEND TESTING FIRST.

There may be some visual bugs on varying distros so before changing your theme test it first with the command.
Now, assuming that you've installed it correctly to test it:

```bash
sddm-greeter --test-mode --theme genshin-sddm-theme
```

## Applying

If you are new and you don't know how to change the SDDM theme, follow these steps:

1. Edit the config file in '/etc/sddm.conf'. If you don't have 'sddm.conf' file, then copy it from '/usr/lib/sddm/default.conf'. If you are on hyprdots, then the config file will be in '/etc/sddm.conf.d/kde_settings.conf'.

    ```bash
    sudo nano /path/to/your/config/file
    ```

2. Look for the following section in the configuration file:

    ```ini
    [Theme]
    Current=
    ```

3. Change your theme to `genshin-sddm-theme`.

## Credits

This is the modified version of [prasanthrangan's corner theme](https://github.com/prasanthrangan/hyprdots) for hyprland

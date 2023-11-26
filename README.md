# Genshin Sddm Theme

An animated genshin sddm-theme, comes with animated background
implemented changing backgrounds for the time of day. 
(will be added in the future)With every login-session,new wallpaper
will be shown based on the time on your OS. 

![](preview/2.png)
## Features

It includes Power Menu and Session Menu.Date&Time will be added.
You can change almost all the colors within the 'theme.conf' file.

1. <b>Power Menu</b>: 
    Ability to sleep,shut-down or restart the os.

2. <b>Session Menu</b>: 
    Ability to choose a session

#### Background Changer

I want to add different wallpapers for different time of the day but still working on it.Will be added asap.

## Issues and Contribution

If you would like to contribute to this repo please do so by creating a PR. I am open to suggestions.


## Dependencies

Install sddm(Simple Desktop Display Manager).To do so 
For Arch Linux
```bash
sudo pacman -S sddm 
```
For Debian-based systems
```bash
sudo apt-get install sddm
```



## Procedure to Test

Follow the below steps to test it:

To test it before use you need to install this repo and copy it to your sddm themes folder.
In order to do this:
For Arch Linux:
```bash
cd
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
sudo cp -r /genshin-sddm-theme/ /usr/share/sddm/themes/
```
For Debian-based systems:
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

I HIGHLY RECOMMEND TESTING FIRST.There may be some visual bugs on varying distros so before changing your theme test it first with the command.
Now, assuming that you've installed it correctly to test it:

```bash
sddm-greeter --test-mode --theme genshin-sddm-theme
```

## Applying

If you are new and you don't know how to change the SDDM theme, follow these steps:

1. Edit the config file in /etc/sddm.conf.If you don't have sddm.conf file then copy it from /usr/lib/sddm/default.conf.If you are on hyprdots then config file will be in /etc/sddm.conf.d/kde_settings.conf
```bash
sudo nano /path/to/your/config/file```
2. Look for

[Theme]
Current=

3. Step 3
Change your theme to genshin-sddm-theme

    
## Credits

This is the modified version of [prasanthrangan's corner theme](https://github.com/prasanthrangan/hyprdots) for hyprland


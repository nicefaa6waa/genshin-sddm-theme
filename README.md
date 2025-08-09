![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/nicefaa6waa/genshin-sddm-theme?utm_source=oss&utm_medium=github&utm_campaign=nicefaa6waa%2Fgenshin-sddm-theme&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)

# Genshin SDDM Theme

An animated SDDM theme inspired by Genshin Impact:
- Dynamic backgrounds based on time of day (morning/sunlight/night)
- Optional door/loading animations
- Compact music player with popup controls
- Session and power menus
- New installer with a clean GUI (Zenity) and a CLI fallback

![](preview/image1.png)

---

## Quick Start

```bash
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
cd genshin-sddm-theme
bash install-sddm-theme.sh           # GUI (Zenity) if available
bash install-sddm-theme.sh --cli     # CLI-only mode
```

During installation you can:
- Download background videos (Dropbox/Mega)
- Configure an optional xrandr resolution override
- Add user accounts (passwords are SHA-256 hashed)
- Toggle the loading animation (enable/disable)

Test the theme:
```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/genshin-sddm-theme
```

---

## Features and Development (84.75% Completed)

You can customize almost all colors in theme.conf. More options will be added.

<details>
  <summary><b>✔️ Animated Background (2/2)</b></summary>

- [x] Uncompressed Videos
  - [x] Morning Background
  - [x] Sunlight Background
  - [x] Night Background
- [x] Compressed Videos
  - [x] Morning Background
  - [x] Sunlight Background
  - [x] Night Background

![](preview/image.png)
</details>

<details>
  <summary>✔️ <b>Login Menu (4/4)</b></summary>

- [x] Login Background
- [x] Username Area
- [x] Password Area
- [x] GitHub and LinkedIn credits

![](preview/image4.png)
</details>

<details>
   <summary>✔️ <b>Power Menu (2/2)</b></summary>

- [x] Mouse Area
- [x] Pop-Up Menu
  - [x] Shutdown
  - [x] Restart
  - [x] Sleep

![](preview/image3.png)
</details>

<details>
   <summary>✔️ <b>Session Menu (2/2)</b></summary>

- [x] Mouse Area
- [x] Pop-Up Menu
  - [x] Choose session

![](preview/image2.png)
</details>

<details>
  <summary><b>✔️ Date & Time Menu (1/1)</b></summary>

- [x] Layout
</details>

<details>
   <summary>✔️ <b>Door Animation (5/5)</b></summary>

- [x] Validate username and password
- [x] fragmentShader config for transparent videos
- [x] Door Videos
  - [x] Morning Door
  - [x] Sunlight Door
  - [x] Night Door
- [x] Transparent Videos
  - [x] Morning Door
  - [x] Sunlight Door
  - [x] Night Door
- [x] Encoded Videos

  ❌ Transparent MOV (didn’t work)  
  ❌ Transparent WebM (didn’t work)  
  ❌ Custom function for PNG sequence (didn’t work)

  ✔️ Current approach: fragmentShader with black background (works, but not ideal; improvements planned)

![](preview/image5.png)
</details>

<details>
  <summary>✔️ <b>Loading Animation (1/1)</b></summary>

- [x] 1:1 replica of Genshin’s loading animation on successful login.

![](preview/image6.png)
</details>

<details>
  <summary>✔️ <b>Variable Animations by Time of Day (3/3)</b></summary>

- [x] Morning animations
- [x] Sunlight animations
- [x] Night animations
</details>

<details>
  <summary><b>✔️ Custom Songs and Music Player (2/2)</b></summary>

- [x] List of custom songs
- [x] Music player on login screen (previous/pause/next)
</details>

<details>
  <summary>✔️ <b>Install Script</b> (4/4)</summary>

- [x] Auto-download videos (Dropbox/Mega; Google Drive manual link below)
- [x] Add users
- [x] Change current theme
- [x] GUI installer via Zenity with CLI fallback (use --cli)
</details>

<details>
   <summary>✔️ <b>Windows Version</b> (Finished in a separate repository) (6/6)</summary>

- [x] Re-create QML theme in Qt 6
- [x] Re-create/fix types and arguments
- [x] Optimize variables
- [x] OS-based settings
- [x] Build application
- [x] Deploy build

Note: Many features are trimmed for Qt 6 compatibility; lock screen is the initial focus before restoring features.
</details>

<details>
  <summary>✔️ <b>Add Custom SFX</b> (2/2)</summary>

- [x] SFX for button click
- [x] SFX for door animations
</details>

<details>
  <summary>✔️ <b>SHA-256 Encryption</b> (3/3)</summary>

- [x] Custom pure JS SHA-256 for password hashing
- [x] Script to update users
- [x] Updated scripts
</details>

<details>
  <summary>⚙️ <b>Custom GRUB Theme</b> (1/7)</summary>

- [x] Design a custom background image
- [ ] Customize fonts and colors for menu items
- [ ] Add icons for different menu entries
- [ ] Configure the boot menu layout
- [ ] Test the theme on a virtual machine
- [ ] Troubleshoot and fix display issues
- [ ] Script for automated installation
</details>

<details>
  <summary>⏸️ <b>Custom Lock Theme</b> (0/2) (Paused)</summary>

- [ ] Build a custom lockscreen (swaylock layering conflicts)
- [ ] Focus on optimization/layout fixes and lock screen
</details>

❌ ~~Add AUR compatibility~~ (maybe later)  
❌ ~~Custom Plymouth theme~~ (maybe later)  
❌ ~~Custom wlogout theme~~ (maybe later)

---

## Issues and Contribution

Before opening an issue, please check the Wiki for common issues and solutions. PRs are welcome.

---

## Dependencies

For Arch-based distros (pacman):
```bash
sudo pacman -S --needed gst-libav phonon-qt5-gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly qt5-quickcontrols2 qt5-graphicaleffects qt5-multimedia qt6-base xorg-xrandr nodejs npm zenity --overwrite '*'
```

For Debian/Ubuntu-based (apt):
```bash
sudo apt-get install gstreamer1.0-libav qml-module-qtmultimedia libqt5multimedia5-plugins qt6-base-dev x11-xserver-utils nodejs npm zenity
```

For Kubuntu (apt):
```bash
sudo apt install gstreamer1.0-libav phonon4qt5-backend-gstreamer gstreamer1.0-plugins-good qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtmultimedia qt5-default qt6-base nodejs npm zenity
```

Zenity is optional (only for the GUI installer). The script falls back to CLI automatically if Zenity/DISPLAY is unavailable.

---

## Installing and Testing

Installation is simple with the installer script:
```bash
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
cd genshin-sddm-theme
bash install-sddm-theme.sh           # GUI (Zenity) if available
bash install-sddm-theme.sh --cli     # CLI-only mode
```

If you prefer manual installation:
<details>
<summary><b>⚙️ Manual Installation Instructions</b></summary>

Clone and copy the theme:

For Arch-based:
```bash
cd
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
sudo cp -r genshin-sddm-theme/ /usr/share/sddm/themes/
```

For Debian-based:
```bash
cd
git clone https://github.com/nicefaa6waa/genshin-sddm-theme.git
sudo cp -r genshin-sddm-theme /usr/share/sddm/themes/
```

Download backgrounds (manual Google Drive link if not using installer):  
[Google Drive](https://drive.google.com/drive/folders/1Yz2GxV8uvZJM16YSbE2yPRMT58H5o0Bs?usp=drive_link)

Unzip packs into the theme:
```bash
# Uncompressed zip
sudo unzip -q -d /usr/share/sddm/themes/genshin-sddm-theme/backgrounds/ ~/Downloads/Uncompressed*.zip
# Compressed zip
sudo unzip -q -d /usr/share/sddm/themes/genshin-sddm-theme/backgrounds/ ~/Downloads/Compressed*.zip
```

Recommended: test before applying globally:
```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/genshin-sddm-theme
```
</details>

---

## Applying

If you’re on KDE Plasma, change SDDM theme via System Settings. Otherwise:

1) Edit your SDDM config (path varies):
- /etc/sddm.conf
- /etc/sddm.conf.d/kde_settings.conf
- /usr/lib/sddm/sddm.conf.d/default.conf

```bash
sudo nano /path/to/your/config/file
```

2) Set the theme:
```ini
[Theme]
Current=genshin-sddm-theme
```

---

## Credits

This theme is a modified version of [aczw’s corner theme](https://github.com/aczw/sddm-theme-corners).

Disclaimer: All videos belong to HoYoverse.

---

## Stars

Thank you all!


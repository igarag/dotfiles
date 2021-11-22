## Qtile configuration

- Touchpad - [tap touchpad to click](https://www.mail-archive.com/qtile-dev@googlegroups.com/msg01550.html)

  ```bash
  # /usr/share/X11/xorg.conf.d/40-libinput.conf
  . . .
  Section "InputClass"
          Identifier "libinput touchpad catchall"
          MatchIsTouchpad "on"
          MatchDevicePath "/dev/input/event*"
          Driver "libinput"
          Option "Tapping" "on"	 # <--------
          Option "NaturalScrolling" "true"
  EndSection
  . . .
  ```

Library installed:

- Pulseaudio:

  ```bash
  sudo pacman -S pulseaudio
  ```

- Pavucontrol

  ```bash
  sudo pacman -S pavucontrol
  ```

- Volumen icon:

  ```bash
  sudo pacman -S volumeicon
  ```

- nm-applet

  ```bash
  sudo pacman -S network-manager-applet
  ```

- Net-tools

  ```bash
  sudo pacman -S net-tools
  ```

- PCManFM

  ```bash
  sudo pacman -S pacmanfm
  ```

- Scripts de ROFI para cambiar el monitor: Mover el script de monitor a `~/.local/bin/`

  ```bash
  cp monitor_layout ~/.local/bin/
  ```


- Dependencia para que aparezca el reproductor en el top-bar

  ```bash
  pip install -U dbus-next
  ```


- Icono de la batería

  ```bash
  sudo pacman -S cbatticon
  ```

- Redshift para reducir el brillo al modo noche:

  ```bash
  sudo pacman -S redshift
  ```

  
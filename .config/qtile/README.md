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

  
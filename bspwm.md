# bspwm

[Repo](https://github.com/baskerville/bspwm) - [Wiki](https://github.com/baskerville/bspwm/wiki)

- bspwm --> Entorno de escritorio
- sxhkd --> Gestor de shortcuts



## 1. `xinitrc`

Creamos `.xinitrc` para que arranque `bspwm` al inicio con el siguiente contenido:

```bash
sxhkd &
exec bspwm
```

- Instalar `compton`
    ```bash
    sudo apt install compton
    ```


- Instalar `feh` (fondo de pantalla)
	```
	sudo apt install -y feh
	```


- Install `rofi` (para el lanzador de aplicaciones)
    ```bash
    sudo apt install -y rofi
    ```

- Crear el script para el redimensionado en `~/.config/bspwm_resize`

  ```bash
  #!/usr/bin/env bash
  # Author: s4vitar
  
  if bspc query -N -n focused.floating > /dev/null; then
      step=20
  else
      step=100
  fi
  
  case "$1" in
      west) dir=right; falldir=left; x="-$step"; y=0;;
      east) dir=right; falldir=left; x="$step"; y=0;;
      north) dir=top; falldir=bottom; x=0; y="-$step";;
      south) dir=top; falldir=bottom; x=0; y="$step";;
  esac
  
  bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"
  ```

  





- Instalar `polybar`. [Repo](https://github.com/polybar/polybar#getting-started)
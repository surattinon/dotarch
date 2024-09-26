# Basu Dotfiles

This dotfiles use to bootstrap archlinux with some basic package and configuration

## Steps to produce

Clone this repo...
```bash
git clone https://github.com/surattinon/... ~/dotfiles
```
and ensure you have the following install in the system

### Prepare your arch

```bash
# Update System
sudo pacman -Syu

# Install git and stow
sudo pacman -S git stow
```

#### Yay

Copy command below to setup yay package manager

```bash
git clone ... /opt/yay
sudo chown -R $USER /opt/yay
cd /opt/yay
makepkg -si
```
### Prepare some packages

```bash
yay -S wl-clipboard nodejs npm
```

### Make symlink for all dotfiles with stow
```bash
stow ~/dotfiles
```
and enjoy krub....

# Neovim — Instalação

## Pré-requisitos

- **Neovim** `>= 0.11.2`
- **Git**, **gcc/make**, **ripgrep**, **fd**
- **[Nerd Font](https://www.nerdfonts.com/)** configurada no terminal
- **Clipboard no Linux:** `xclip` (X11) ou `wl-clipboard` (Wayland)

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y git gcc make ripgrep fd-find xclip
```

## Passo a passo

1. **Faça backup da configuração atual (se existir):**

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

2. **Clone o repositório e crie o symlink:**

```bash
git clone https://github.com/hqrms/dotfiles.git ~/dotfiles
mkdir -p ~/.config
ln -s ~/dotfiles/nvim ~/.config/nvim
```

3. **Abra o Neovim:**

```bash
nvim
```

O `lazy.nvim` instalará os plugins automaticamente na primeira execução. Depois, rode `:checkhealth` para validar o ambiente.

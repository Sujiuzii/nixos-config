# Nix Configuration

这份配置基于 [Crabtux](https://github.com/Crabtux) 的配置进行修改，旨在为 macOS (使用 nix-darwin) 和 NixOS 提供统一且高效的开发环境。

## 概览

本项目包含两套主要的系统配置：

- **macOS (`macos`)**: 适用于 Apple Silicon (aarch64-darwin) 的 nix-darwin 配置。
- **NixOS (`lenovo`)**: 适用于 Lenovo 笔记本 (x86_64-linux) 的 NixOS 配置，包含 Nvidia 显卡支持。

## 截图

### macOS (nix-darwin)

![macOS Screen 1](./_img/nix-darwin-screen1.png)
![macOS Screen 2](./_img/nix-darwin-screen2.png)

### NixOS

![NixOS Screen 1](./_img/NixOS-screen1.png)
![NixOS Screen 2](./_img/NixOS-screen2.png)

## 目录结构

- `flake.nix`: 项目入口，定义了系统和 Home Manager 的配置。
- `hosts/`: 不同主机的具体配置入口。
  - `lenovo/`: NixOS 配置。
  - `macos/`: Darwin 配置。
- `modules/`: 可复用的模块。
  - `darwin/`: macOS 专属系统模块。
  - `nixos/`: NixOS 专属系统模块。
  - `home-manager/`: 用户级软件和点文件配置 (Neovim, Zsh, Kitty, Tmux 等)。
- `profiles/`: 通用配置文件集。
- `pkgs/`: 自定义软件包。
- `overlays/`: Nixpkgs 覆盖层。

## 使用方法

### macOS

构建并切换到新配置：

```bash
darwin-rebuild switch --flake .#macos
```

### NixOS

构建并切换到新配置：

```bash
sudo nixos-rebuild switch --flake .#lenovo
```

## 许可证

本项目采用 MIT 许可证。详情请参阅 [LICENSE](./LICENSE) 文件。

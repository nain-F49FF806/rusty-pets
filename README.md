# rusty-pets

## About

Have you heard of pet containers?

[![Stop Distro Hopping! Use this AWESOME tool on Linux](https://img.youtube.com/vi/Sj064D9ZUl8/0.jpg)](https://www.youtube.com/watch?v=Sj064D9ZUl8)

Here are recipes for creating your perfect supercharged container images for use with _toolbx_/_distrobox_.
What is the special ingredient that goes into these powerful images?
The Chemical X - it's Rust!

Forged in fires of `cargo` these containers go through an intense build process, supercharging them
with sparkling Rust utils. Some of them enhance your regular shell experience and others unlock new abilities.  
You too wish to discover these oxidised powers, yes ;) ? See instruction below to find out how.

> [!TIP]  
> TL;DR: This repo provides _Toolbox_/_Distrobox_ compatible distro images featuring Rust powered tools.


## How to play

### Installation

You can use these container images with Docker or Podman directly. But you'll have a much better experience
with tools like distrobox/toolbx which neatly wrap the former for convenient local pet container usage.

Install [distrobox] or [toolbx] according to install instructions on respective project page.
We recommend distrobox, since it is supported on various host distributions and is easier to customize.  
Links: {[Distrobox install]} {[Toolbx install]}

[distrobox]: https://distrobox.it
[toolbx]: https://containertoolbx.org/
[Distrobox install]: https://github.com/89luca89/distrobox?tab=readme-ov-file#installation
[Toolbx install]: https://containertoolbx.org/install/

### Example usage

```bash
## Create a container with any rusty-pets oxidised image (only need to do this once)
distrobox create --image ghcr.io/nain-f49ff806/rusty-pets/fedora-oxidized.toolbox:latest --name fedoraX

## Enter the created container (whenever you please)
distrobox enter fedoraX
```

You can also assign custom home directory for your pets, to keep separate dotfiles for example.

```bash
## Create a rusty-pets distrobox with separate home
mkdir -p ~/Distroboxes/archX
distrobox create --home ~/Distroboxes/archX --name archX --image ghcr.io/nain-f49ff806/rusty-pets/arch-oxidized.toolbox:latest

## Enter the created container (whenever you please)
distrobox enter archX
```


## What is included?

| Rust Tool           | Like           | Aliased | Notes                                                    | Category          |
|:--------------------|:---------------|:--------|:---------------------------------------------------------|:------------------|
| [bat]               | cat, less      | cat     |                                                          | viewer/navigation |
| [eza]               | ls             | ls      |                                                          | viewer/navigation |
| [zoxide] (zd)      | cd             |         |                                                          | viewer/navigation |
| [Yazi-fm] (yazi)    | nnn            |         | Blazing fast terminal file manager, based on async I/O   | viewer/navigation |
| [hexyl]             | hexdump        | hexdump |                                                          | viewer/navigation |
| [bingrep]           | ?              |         | Cross-platform binary parsing viewer                     | viewer/navigation |
| [bottom] (btm)      | top, htop      | top     |                                                          | process/system    |
| [du-dust] (dust)    | du             | du      |                                                          | process/system    |
| [hyperfine]         | time           | time    |                                                          | process/system    |
| [fd-find] (fd)      | find           | find    |                                                          | file manipulation |
| [ouch]              | tar,gz,xz,zstd |         | Obvious Unified Compression (and decompression) Helper.  | file manipulation |
| [ripgrep] (rg)      | grep           | grep    |                                                          | file manipulation |
| [xsv]               | csvkit         |         | A fast CSV command line toolkit written in Rust.         | file manipulation |
| [git-delta] (delta) | diff           | diff    | Syntax-highlighting pager for git, diff, and grep output | CVS               |
| [gitui]             | ?              |         | Blazing 💥 fast terminal-ui for git                      | CVS               |
| [nu]                | bash,zsh,fish  |         | New type of shell, with structured data pipelines        |                   |
| [starship]          | Liquid-prompt  |         | Customizable prompt for any shell!                       |                   |
| [watchexec-cli]     | watchman       |         | Executes commands in response to file modifications      |                   |

[bat]: https://github.com/sharkdp/bat
[eza]: https://github.com/eza-community/eza
[zoxide]: https://github.com/ajeetdsouza/zoxide
[Yazi-fm]: https://github.com/sxyazi/yazi
[hexyl]: https://github.com/sharkdp/hexyl
[bingrep]: https://github.com/m4b/bingrep
[bottom]: https://github.com/ClementTsang/bottom
[du-dust]: https://github.com/bootandy/dust
[hyperfine]: https://github.com/sharkdp/hyperfine
[fd-find]: https://github.com/sharkdp/fd
[ouch]: https://github.com/ouch-org/ouch
[ripgrep]: https://github.com/BurntSushi/ripgrep
[xsv]: https://github.com/BurntSushi/xsv
[git-delta]: https://github.com/dandavison/delta
[gitui]: https://github.com/extrawurst/gitui
[nu]: https://github.com/nushell/nushell
[starship]: https://github.ink/starship/starship
[watchexec-cli]: https://github.com/watchexec/watchexec

### Inclusion Criteria

| Spirit      | Measurement                                                                                       |
|:------------|---------------------------------------------------------------------------------------------------|
| Wide appeal | Have many stars. ~1K+ is good rule of thumb but new or niche-popular tools may also be considered |
| Maintained  | Update in last year. Either in code repo or a statement by author on any channel                  |
| FOSS        | Free and Open Source Licence (Either [OSI list] or [FSF list])                                    |

[OSI list]: https://opensource.org/licenses/
[FSF list]: https://www.gnu.org/licenses/license-list.html

> [!NOTE]  
> Measurements can be falliable, let the spirit of the criteria guide us.


## Todo / Wishlist

- [ ] Popular distro triad
  - [x] Image for Fedora
  - [ ] Image for Ubuntu
  - [x] Image for Arch
- [ ] More Rust tools
  - [ ] Helix editor
  - [ ] Rage
  - [ ] Zellij
  - [ ] tealdeer/tlrc (prefer distro package for autocompletions)
  - [ ] procs
  - [ ] rust uutils?
  - [ ] navi?
  - [ ] ?
- [ ] More aliases
  - [x] time?
  - [x] grep?
  - [x] hexdump?
  - [x] find?
  - [x] diff?
  - [ ] watchman 


## License

Licensed under either of

 * Apache License, Version 2.0
   (http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license
   (http://opensource.org/licenses/MIT)

at your option.

`SPDX-License-Identifier: Apache-2.0 OR MIT`


## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.

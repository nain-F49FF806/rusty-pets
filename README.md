# rusty-pets

Have you heard of pet containers?

[![Stop Distro Hopping! Use this AWESOME tool on Linux](https://img.youtube.com/vi/Sj064D9ZUl8/0.jpg)](https://www.youtube.com/watch?v=Sj064D9ZUl8)

Here are recipes for creating your perfect supercharged container images for use with toolbx/distrobox.
What is the special ingredient that goes into these powerful images?
The Chemical X - it's Rust!

Forged in fires of `cargo` these containers go through an intense build process, supercharging them
with sparkling Rust utils. Some of them enhance your regular shell experience and others unlock new abilities.  
You too wish to discover these oxidised powers, yes ;) ? See instruction below to find out how.


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
distrobox create --image ghcr.io/nain-f49ff806/rusty-pets/fedora-oxidized.toolbox:latest --name fedoraX-39

## Enter the created container (whenever you please)
distrobox enter fedoraX-39
```


## What is included?

| Tool              | Like           | Aliased | Notes                                                    | Category          |
|:------------------|:---------------|:--------|:---------------------------------------------------------|:------------------|
| bat               | cat, less      | cat     |                                                          | viewer/navigation |
| eza               | ls             | ls      |                                                          | viewer/navigation |
| zoxide (zd)       | cd             |         |                                                          | viewer/navigation |
| Yazi-fm (yazi)    | nnn            |         | Blazing fast terminal file manager, based on async I/O   | viewer/navigation |
| hexyl             | hexdump        |         |                                                          | viewer/navigation |
| bingrep           | ?              |         | Cross-platform binary parsing viewer                     | viewer/navigation |
| bottom (btm)      | top, htop      | top     |                                                          | process/system    |
| du-dust (dust)    | du             | du      |                                                          | process/system    |
| hyperfine         | time           |         |                                                          | process/system    |
| fd-find (fd)      | find           |         |                                                          | file manipulation |
| ouch              | tar,gz,xz,zstd |         | Obvious Unified Compression (and decompression) Helper.  | file manipulation |
| ripgrep           | grep           |         |                                                          | file manipulation |
| xsv               | csvkit         |         | A fast CSV command line toolkit written in Rust.         | file manipulation |
| git-delta (delta) | diff           |         | Syntax-highlighting pager for git, diff, and grep output | CVS               |
| gitui             | ?              |         | Blazing 💥 fast terminal-ui for git                      | CVS               |
| nu                | bash,zsh,fish  |         | New type of shell, with structured data pipelines        |                   |
| starship          | Liquid-prompt  |         | Customizable prompt for any shell!                       |                   |
| watchexec-cli     | watchman       |         | Executes commands in response to file modifications      |                   |


## Todo / Wishlist

- [ ] Popular distro triad
  - [x] Image for Fedora
  - [ ] Image for Ubuntu
  - [ ] Image for Arch
- [ ] More Rust tools
  - [ ] Helix editor
  - [ ] Rage
  - [ ] Zellij
  - [ ] ?
- [ ] More aliases
  - [ ] time?
  - [ ] grep?
  - [ ] hexdump?
  - [ ] find?
  - [ ] diff?

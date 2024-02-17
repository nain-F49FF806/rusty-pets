# rusty-pets

Have you heard of pet containers?
These here are recipes for creating your perfect container for use with toolbx/distrobox.

What is the special ingredient used to make these powerful images?
The Chemical X - it's Rust!

Forged in fires of `cargo` these containers go through an intense build process, supercharging them
with sparkling Rust utils. Some of them enhance your regular shell experience and others unlock new abilities.
You too wish to discover these oxidised powers, yes ;) ? See instruction below to find out how.

## How to play


You can use these containers with Docker or Podman directly, but you'll have a much better experience
with tools like distrobox/toolbx which neatly wrap the former for convenience.

Install [distrobox] or [toolbx] according to install instructions on respective page.
We recommend distrobox, since it is supported on various host distributions and is easier to customize.  
Links: {[Distrobox install]} {[Toolbx install]}

[distrobox]: https://distrobox.it
[toolbx]: https://containertoolbx.org/
[Distrobox install]: https://github.com/89luca89/distrobox?tab=readme-ov-file#installation
[Toolbx install]: https://containertoolbx.org/install/


### Example usage

```bash
## Create a container with rusty-pets' oxidised toolbox image (only need to do this once)
distrobox create --image ghcr.io/nain-f49ff806/rusty-pets/fedora-oxidized.toolbox:latest --name fedoraX-39

## Enter the created container (whenever you please)
distrobox enter fedoraX-39
```


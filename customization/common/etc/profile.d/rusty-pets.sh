#!/bin/env bash

# Rust binaries location, add to path

[[ ":$PATH:" != *":/opt/cargo/bin:"* ]] && PATH="/opt/cargo/bin:${PATH}"

# Rust aliases

alias ls='eza'
alias cat='bat --style="header,grid"'
alias top='btm --battery'
alias du='dust -p'
alias time=hyperfine
alias grep=rg
alias hexdump=hexyl
alias diff=delta
alias find=fd

# Rust tools init

[ "${BASH_VERSION:-}" != "" ] && eval "$(zoxide init bash)"
[ "${ZSH_VERSION:-}" != "" ] && eval "$(zoxide init zsh)"

[ "${BASH_VERSION:-}" != "" ] && eval "$(starship init bash)"
[ "${ZSH_VERSION:-}" != "" ] && eval "$(starship init zsh)"

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Rusty pets welcome message (one time)

RP_INTRO_MESSAGE="Welcome !
You are now in a 🦀rusted🦀 toolbx image, also known as 🔥oxidized🔥 image.
Here, you will find many Rust-lang based utils for a better shell experience. 

For more info see readme
https://github.com/nain-F49FF806/rusty-pets?tab=readme-ov-file#what-is-included
"

if [ ! -f ~/.config/rusty-pets/intro-message-seen ]; then
	mkdir -p ~/.config/rusty-pets
    echo "${RP_INTRO_MESSAGE}" | tee ~/.config/rusty-pets/intro-message-seen

	# Tip regarding starship
	if [ "${BASH_VERSION:-}" != "" ] || [ "${ZSH_VERSION:-}" != "" ]; then
		echo "Tip: To activate starship prompt, run the following"
		echo ". /opt/rusty-pets/starship-activate"
	fi
fi

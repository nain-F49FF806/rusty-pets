FROM rust:latest as builder

# Required for building starship
RUN apt update && apt install -y cmake

COPY useful-crates /useful-crates
RUN cargo install $(cat useful-crates)
RUN rm /useful-crates


FROM quay.io/toolbx-images/fedora-toolbox:39 as fedora-oxidized.toolbox

ARG NAME=fedora-oxidized.toolbox
ARG VERSION=39
LABEL com.github.containers.toolbox="true" \
      com.redhat.component="$NAME" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbx or distrobox command" \
      summary="Rusted image based on Fedora Toolbox base container" \
      maintainer="nain <no-reply@you-are-on-your-own-for-now.alt>"

# Pull in useful rust tools
## https://doc.rust-lang.org/stable/cargo/guide/cargo-home.html#caching-the-cargo-home-in-ci
## If you wish to cache binaries installed with cargo install, you need to cache the bin/ folder and the .crates.toml and .crates2.json files.
COPY --from=builder /usr/local/cargo/bin/ /usr/local/cargo/.crates.toml /usr/local/cargo/.crates2.json /opt/cargo/
ENV PATH=/opt/cargo/bin:$PATH 

COPY customization/rusty-fedora/profile.d/* /etc/profile.d/
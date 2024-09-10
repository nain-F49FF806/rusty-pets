FROM rust:latest as builder

# Required for building starship
RUN --mount=type=cache,target=/var/cache/apt \
    apt update && apt install -y cmake

COPY useful-crates /useful-crates
RUN \
    --mount=type=cache,target=${CARGO_HOME}/git \
    --mount=type=cache,target=${CARGO_HOME}/registry \
    cargo install --locked $(cat useful-crates)
RUN rm /useful-crates


# --- Fedora ---
FROM registry.fedoraproject.org/fedora-toolbox:39 as fedora-oxidized.toolbox

ARG NAME=fedora-oxidized.toolbox
ARG VERSION=39
ARG USAGE="This image is meant to be used with the toolbx or distrobox command"
ARG SUMMARY="Rusted image based on Fedora Toolbox base container"
LABEL com.github.containers.toolbox="true" \
      com.redhat.component="$NAME" \
      name="$NAME" \
      version="$VERSION" \
      usage="$USAGE" \
      summary="$SUMMARY" \
      maintainer="nain <no-reply@you-are-on-your-own-for-now.alt>"
LABEL org.opencontainers.image.description "${SUMMARY}. ${USAGE}"

# Pull in useful rust tools
## https://doc.rust-lang.org/stable/cargo/guide/cargo-home.html#caching-the-cargo-home-in-ci
## If you wish to cache binaries installed with cargo install, you need to cache the bin/ folder and the .crates.toml and .crates2.json files.
COPY --from=builder /usr/local/cargo/bin/ /opt/cargo/bin/
COPY --from=builder /usr/local/cargo/.crates.toml /usr/local/cargo/.crates2.json /opt/cargo/
ENV PATH=/opt/cargo/bin:$PATH

COPY customization/common/files/ /
COPY customization/rusty-fedora/files/ /

COPY customization/rusty-fedora/scripts/ /scripts/
RUN for i in /scripts/*; do  if [ -r $i ]; then  . $i;  fi;  done
RUN rm -r /scripts


# --- Ubuntu ---
FROM quay.io/toolbx/ubuntu-toolbox:23.10 as ubuntu-oxidized.toolbox

ARG NAME=ubuntu-oxidized.toolbox
ARG VERSION=23.10
ARG USAGE="This image is meant to be used with the toolbx or distrobox command"
ARG SUMMARY="Rusted image based on Ubuntu Toolbox base container"
LABEL com.github.containers.toolbox="true" \
      com.redhat.component="$NAME" \
      name="$NAME" \
      version="$VERSION" \
      usage="$USAGE" \
      summary="$SUMMARY" \
      maintainer="nain <no-reply@you-are-on-your-own-for-now.alt>"
LABEL org.opencontainers.image.description "${SUMMARY}. ${USAGE}"

# Pull in useful rust tools
## https://doc.rust-lang.org/stable/cargo/guide/cargo-home.html#caching-the-cargo-home-in-ci
## If you wish to cache binaries installed with cargo install, you need to cache the bin/ folder and the .crates.toml and .crates2.json files.
COPY --from=builder /usr/local/cargo/bin/ /opt/cargo/bin/
COPY --from=builder /usr/local/cargo/.crates.toml /usr/local/cargo/.crates2.json /opt/cargo/
ENV PATH=/opt/cargo/bin:$PATH 

COPY customization/common/files/ /
COPY customization/rusty-ubuntu/files/ /


# --- Arch ---
FROM quay.io/toolbx/arch-toolbox:latest as arch-oxidized.toolbox

ARG NAME=arch-oxidized.toolbox
ARG VERSION=latest
ARG USAGE="This image is meant to be used with the toolbx or distrobox command"
ARG SUMMARY="Rusted image based on Arch Toolbox base container"
LABEL com.github.containers.toolbox="true" \
      com.redhat.component="$NAME" \
      name="$NAME" \
      version="$VERSION" \
      usage="$USAGE" \
      summary="$SUMMARY" \
      maintainer="nain <no-reply@you-are-on-your-own-for-now.alt>"
LABEL org.opencontainers.image.description "${SUMMARY}. ${USAGE}"

# Pull in useful rust tools
## https://doc.rust-lang.org/stable/cargo/guide/cargo-home.html#caching-the-cargo-home-in-ci
## If you wish to cache binaries installed with cargo install, you need to cache the bin/ folder and the .crates.toml and .crates2.json files.
COPY --from=builder /usr/local/cargo/bin/ /opt/cargo/bin/
COPY --from=builder /usr/local/cargo/.crates.toml /usr/local/cargo/.crates2.json /opt/cargo/
ENV PATH=/opt/cargo/bin:$PATH 

COPY customization/common/files/ /
COPY customization/rusty-arch/files/ /

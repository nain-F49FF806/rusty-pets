FROM rust:latest as builder

# Required for starship
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

RUN mkdir -p /opt/cargo/bin
COPY --from=builder /usr/local/cargo/bin/* /opt/cargo/bin/
ENV PATH=/opt/cargo/bin:$PATH 

COPY customization/rusty-fedora/profile.d/* /etc/profile.d/

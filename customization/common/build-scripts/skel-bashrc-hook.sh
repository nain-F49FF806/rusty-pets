#!/bin/bash

RP_BASHRC_HOOK="if [ -e /run/.rustypetsenv ]; then source /etc/profile.d/rusty-pets.sh; fi"

echo $RP_BASHRC_HOOK | sudo tee -a /etc/skel/.bashrc
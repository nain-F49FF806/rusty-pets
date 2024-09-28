#!/bin/bash

echo "if [ -e /run/.rustypetsenv ]; then source /etc/profile.d/rusty-pets.sh; fi" | sudo tee -a /etc/skel/.bashrc
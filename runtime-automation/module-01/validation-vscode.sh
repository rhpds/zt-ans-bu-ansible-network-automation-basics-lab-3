#!/bin/bash

set -euxo pipefail

if ! grep "ssh cisco" /home/rhel/.bash_history; then
    echo "Please SSH to the cisco device to run the commands"
fi
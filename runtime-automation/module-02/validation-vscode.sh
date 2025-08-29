#!/bin/bash

set -euxo pipefail

if [ ! -f /home/rhel/resource.yml ]; then
    echo "No file was found at /home/rhel/resource.yml"
fi

if ! grep "snmp_server" /home/rhel/resource.yml; then
    echo "The resource.yml playbook doesn't contain the snmp_server module"
fi
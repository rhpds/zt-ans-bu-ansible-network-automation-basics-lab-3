#!/bin/bash

set -euxo pipefail

if [ ! -f /home/rhel/resource.yml ]; then
    echo "No file was found at /home/rhel/resource.yml"
    exit 1
fi

if ! grep "cisco.ios.snmp_server:" /home/rhel/resource.yml; then
    echo "The resource.yml playbook doesn't contain the snmp_server module"
    exit 1
fi
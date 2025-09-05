#!/bin/bash
set -euxo pipefail

if [ ! -f /home/rhel/gathered.yml ]; then
    echo "No Ansible Playbook was found at /home/rhel/gathered.yml"
    exit 1
fi

if [ ! -f /home/rhel/cisco_snmp.yml]; then
    echo "No gathered data file was found at /home/rhel/cisco_snmp.yml"
    exit 1
fi

if ! grep "gathered" /home/rhel/gathered.yml; then
    echo "The file doesn't contain the parameter gathered"
    exit 1
fi
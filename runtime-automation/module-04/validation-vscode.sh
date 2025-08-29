#!/bin/bash
set -euxo pipefail

if [ ! -f /home/rhel/gathered.yml ]; then
    echo "No Ansible Playbook was found at /home/rhel/gathered.yml"
fi

if [ ! -f /home/rhel/cisco_snmp.yml]; then
    echo "No gathered data file was found at /home/rhel/cisco_snmp.yml"
fi

if ! grep "gathered" /home/rhel/gathered.yml; then
    echo "The file doesn't contain the parameter gathered"
fi
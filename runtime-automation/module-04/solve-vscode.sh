#!/bin/bash

su - $USER -c 'cat >/home/rhel/gathered.yml << EOF
---
---
- name: retrieve SNMP config
  hosts: cisco
  gather_facts: false
  tasks:

    - name: use SNMP resource module
      cisco.ios.snmp_server:
        state: gathered
      register: snmp_config

    - name: copy snmp_config to file
      copy:
        content: "{{ snmp_config | to_nice_yaml }}"
        dest: "{{ playbook_dir }}/{{ inventory_hostname }}_snmp.yml"

EOF
cat /home/rhel/gathered.yml'
su - rhel -c 'ansible-navigator run /home/rhel/gathered.yml --mode stdout'
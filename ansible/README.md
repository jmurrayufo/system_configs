ansible all -m ping
ansible-playbook upgrade.yaml -K
ansible-playbook upgrade.yaml -K -l bigbox

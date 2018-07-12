#!/bin/bash -xe
    
install -o root -g root -m 0400 /secrets/ecdsa-private /etc/ssh/ssh_host_ecdsa_key
install -o root -g root -m 0444 /secrets/ecdsa-public /etc/ssh/ssh_host_ecdsa_key.pub
install -o ubuntu -g ubuntu -m 0400 /secrets/user-ssh-keys /home/ubuntu/.ssh/authorized_keys
install -o root -g root -m 0600 -d /run/sshd

exec /usr/sbin/sshd -D

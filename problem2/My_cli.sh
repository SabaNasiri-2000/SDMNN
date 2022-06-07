#!/bin/bash


a=$(date)
PART=(${a// / })

sudo mkdir ${PART[4]}
sudo tar -zxf ubuntu-focal-oci-amd64-root.tar.gz -C ./${PART[4]}

sudo unshare --fork --pid --mount-proc -n -u -m --root=./${PART[4]} bash -c "hostname $1 && /bin/bash"

sudo rm -r ${PART[4]}




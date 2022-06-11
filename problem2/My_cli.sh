#!/bin/bash


a=$(date)
PART=(${a// / })
s=$(echo ${PART[4]} | tr ":" "\n")
b='container'
for addr in $s
do
    b+=$addr
done

sudo mkdir ${PART[4]}
sudo tar -zxf ubuntu-focal-oci-amd64-root.tar.gz -C ./${PART[4]}
sudo cgcreate -g memory:$b

echo $2 | sudo tee /sys/fs/cgroup/memory/$b/memory.limit_in_bytes 1>/dev/null
 
sudo cgexec -g memory:$b unshare --fork --pid --mount-proc -n -u -m --root=./${PART[4]} bash -c "hostname $1 && /bin/bash"

sudo rm -r ${PART[4]}
sudo rmdir /sys/fs/cgroup/memory/$b



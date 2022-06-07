#!/bin/bash
sudo touch /root/uts-ns
sudo touch /root/net-ns


sudo unshare --net=/root/net-ns --uts=/root/uts-ns hostname saba


sudo nsenter --uts=/root/uts-ns --net=/root/net-ns /bin/bash

sudo umount /root/uts-ns
sudo umount /root/net-ns


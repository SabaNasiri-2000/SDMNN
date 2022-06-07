#!/bin/bash


sudo unshare --fork --pid --mount-proc -n -u -m bash -c "hostname saba && /bin/bash"






#!/bin/bash



echo "Enter the nodes:"
read x 
read y
if [[ $y = "node1" ]]; 
then
a=172.0.0.2
fi
if [[ $y = "node2" ]]; 
then
a=172.0.0.3
fi
if [[ $y = "node3" ]]; 
then
a=10.10.0.2
fi
if [[ $y = "node4" ]]; 
then
a=10.10.0.3
fi
if [[ $y = "router" ]]; 
then
	if [[ $x = "node1" ]];then
		a=172.0.0.1
	fi
	if [[ $x = "node1" ]];then
		a=172.0.0.1
	fi
	if [[ $x = "node3" ]];then
		a=10.10.0.1
	fi
	if [[ $x = "node4" ]];then
		a=10.10.0.1
	fi
fi

ip netns exec $x ping $a

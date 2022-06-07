#!/bin/bash

ip netns delete node1
ip netns delete node2
ip netns delete node3
ip netns delete node4
ip netns delete router
ip link set br1 down
ip link set br2 down
brctl delbr br1
brctl delbr br2
ip link set ethN1 down
ip link set ethN2 down
ip link set ethN3 down
ip link set ethN4 down
ip link set brethn1 down
ip link set brethn2 down
ip link set brethn3 down
ip link set brethn4 down
ip link set ethrouter1 down
ip link set ethrouter2 down
ip link set brethrouter1 down
ip link set brethrouter2 down






ip netns add node1
ip netns add node2
ip netns add node3
ip netns add node4
ip netns add router


ip link add ethN1 type veth peer name brethn1
ip link add ethN2 type veth peer name brethn2
ip link add ethrouter1 type veth peer name brethrouter1
ip link add ethN3 type veth peer name brethn3
ip link add ethN4 type veth peer name brethn4
ip link add ethrouter2 type veth peer name brethrouter2


ip link set ethN1 netns node1
ip link set ethN2 netns node2
ip link set ethN3 netns node3
ip link set ethN4 netns node4


ip link add name br1 type bridge
ip link add name br2 type bridge
ip link set brethn1 master br1
ip link set brethn2 master br1
ip link set brethn3 master br2
ip link set brethn4 master br2
ip link set brethrouter1 master br1
ip link set brethrouter2 master br2


ip link set ethrouter1 netns router
ip link set ethrouter2 netns router


ip netns exec node1 ip addr add 172.0.0.2/24 dev ethN1
ip netns exec node2 ip addr add 172.0.0.3/24 dev ethN2
ip netns exec node3 ip addr add 10.10.0.2/24 dev ethN3
ip netns exec node4 ip addr add 10.10.0.3/24 dev ethN4
ip netns exec router ip addr add 172.0.0.1/24 dev ethrouter1
ip netns exec router ip addr add 10.10.0.1/24 dev ethrouter2


ip link set br1 up
ip link set br2 up
ip netns exec node1 ip link set ethN1 up
ip netns exec node2 ip link set ethN2 up
ip netns exec node3 ip link set ethN3 up
ip netns exec node4 ip link set ethN4 up
ip netns exec router ip link set ethrouter1 up
ip netns exec router ip link set ethrouter2 up
ip link set brethn1 up
ip link set brethn2 up
ip link set brethn3 up
ip link set brethn4 up
ip link set brethrouter1 up
ip link set brethrouter2 up




ip netns exec node1 ip link set lo up
ip netns exec node2 ip link set lo up
ip netns exec node3 ip link set lo up
ip netns exec node4 ip link set lo up
ip netns exec router ip link set lo up


ip netns exec node1 route add -net 0.0.0.0/0 gw 172.0.0.1
ip netns exec node2 route add -net 0.0.0.0/0 gw 172.0.0.1
ip netns exec node3 route add -net 0.0.0.0/0 gw 10.10.0.1
ip netns exec node4 route add -net 0.0.0.0/0 gw 10.10.0.1

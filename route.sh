#!/bin/bash

ip route change default via 172.31.1.2
ip route add 192.168.1.0/24 via 172.31.1.1 dev eth0

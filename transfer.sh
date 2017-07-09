#!/bin/bash
set -x #echo on

#mips-openwrt-linux-uclibc-g++ dht_read.cpp checkHumidity.cpp common_dht_read.cpp onion_mmio.cpp -lrt -pthread -ldl -o checkHumidity

make && sshpass -p onioneer scp ./bin/checkHumidity root@192.168.1.17:/root/ && sshpass -p onioneer ssh root@192.168.1.17 ./checkHumidity

#!/bin/bash

# make sure python is installed
sudo apt-get update -y
sudo apt-get install -y python
sudo apt-get install -y python2
sudo apt-get install -y python3
sudo apt-get install -y wget

# prepare speedtest_cli.py
wget -O speedtest-cli.py https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest_cli.py
chmod +x speedtest_cli.py

# fetch server list
./speedtest_cli.py --list | tee server.list

# loop with timer #

# start test #
echo ''
echo '' >> log
echo ''
echo '' >> log
# sydney
echo ''
echo '' >> log
date
date >> log
echo sydney
echo sydney >> log
./speedtest_cli.py --share --server $(grep -i sydney server.list | head -n 1 | awk -F ')' '{print $1}') >> log
# shenzhen
echo ''
echo '' >> log
date
date >> log
echo shenzhen
echo shenzhen >> log
./speedtest_cli.py --share --server $(grep -i shenzhen server.list | head -n 1 | awk -F ')' '{print $1}') >> log


echo waiting next time

echo end
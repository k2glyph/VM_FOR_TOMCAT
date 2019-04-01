#!/bin/sh

# Ubuntu 
# Java 7 installation
if [ -d "/usr/lib/jvm/"]; then
    echo "Already install JVM found in /usr/lib/jvm"
    echo "Installation has been skipping..."
    exit 0
fi
sudo apt-get update -y

sudo apt-get install build-essential rsync telnet screen man wget -y
sudo apt-get install strace tcpdump -y
sudo apt-get install libssl-dev zlib1g-dev libcurl3-dev libxslt-dev -y
sudo apt-get install software-properties-common python-software-properties -y

sudo apt-get install git -y
sudo apt-get install curl -y 

curl -L --cookie "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz -o jdk-7-linux-x64.tar.gz
tar -xvf jdk-7-linux-x64.tar.gz

sudo mkdir -p /usr/lib/jvm
sudo mv ./jdk1.7.* /usr/lib/jvm/

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0_65/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0_65/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.7.0_65/bin/javaws" 1

sudo chmod a+x /usr/bin/java 
sudo chmod a+x /usr/bin/javac 
sudo chmod a+x /usr/bin/javaws
sudo chown -R root:root /usr/lib/jvm/jdk1.7.0_65

rm jdk-7-linux-x64.tar.gz
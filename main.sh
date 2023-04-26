DEBIAN_FRONTEND=noninteractive

# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports

# Clone Upstream
git clone https://github.com/linuxmint/mintsystem
cp -rvf ./debian ./mintsystem
cd ./mintsystem

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

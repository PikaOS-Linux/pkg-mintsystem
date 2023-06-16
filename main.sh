DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/linuxmint/mintsystem
cp -rvf ./debian ./mintsystem
cd ./mintsystem

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

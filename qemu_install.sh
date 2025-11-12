# Create local installation directory
mkdir -p /esd/bata_esd2/esrmosp7/qemu
cd /esd/bata_esd2/esrmosp7/qemu

# Download QEMU source
wget https://download.qemu.org/qemu-7.2.0.tar.xz
tar xvJf qemu-7.2.0.tar.xz
cd qemu-7.2.0

# Configure for local installation
./configure --prefix=/esd/bata_esd2/esrmosp7/qemu --target-list=aarch64-softmmu

# Build and install
make -j$(nproc)
make install

# Add to PATH
echo 'export PATH=/esd/bata_esd2/esrmosp7/qemu/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Verify
qemu-system-aarch64 --version

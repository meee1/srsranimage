from ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

run apt-get update && apt-get install -y build-essential cmake gdb libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev wget libdw-dev libdwarf-dev binutils-dev libusb-1.0-0-dev software-properties-common git && apt-get clean

run add-apt-repository -y ppa:pothosware/framework && add-apt-repository -y ppa:pothosware/support && add-apt-repository -y ppa:myriadrf/drivers

run apt-get update && apt-get install -y pothos-all python3-pothos pothos-python-dev soapysdr-tools osmo-sdr soapysdr-module-osmosdr rtl-sdr soapysdr-module-rtlsdr python3-soapysdr python3-numpy libaio1 libserialport0 && apt-get clean

run wget https://github.com/analogdevicesinc/libiio/releases/download/v0.23/Linux-Ubuntu-20.04-x86_64.tar.gz && tar -xvf Linux-Ubuntu-20.04-x86_64.tar.gz && dpkg -i Linux-Ubuntu-20.04-x86_64/libiio-0.23.g92d6a35-Linux.deb && rm Linux-Ubuntu-20.04-x86_64.tar.gz

run wget https://github.com/analogdevicesinc/libad9361-iio/releases/download/v0.2/ad9361-0.2-Linux.deb && dpkg -i ad9361-0.2-Linux.deb && rm ad9361-0.2-Linux.deb

run apt-get update && apt-get install -y libzmq3-dev python3-distutils mc aptitude bash-completion bash nano swig && apt-get clean

run git clone https://github.com/pothosware/SoapySDR.git && cd SoapySDR && mkdir build && cd build && cmake .. && make -j8 && make install && cd ../..

run ldconfig

run git clone https://github.com/pothosware/SoapyPlutoSDR.git && cd SoapyPlutoSDR && mkdir build && cd build && cmake .. && make -j8 && make install && cd ../..

#cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLIB_INSTALL_DIR:PATH=lib64 -DLIB_SUFFIX=64 -DSOAPY_SDR_ROOT=/usr

run PothosUtil --system-info

run SoapySDRUtil --info

run SoapySDRUtil --find || true

#run SoapySDRUtil --probe="driver=plutosdr,hostname=192.168.2.1"

run git clone https://github.com/srsran/srsRAN_4G.git && cd srsRAN_4G && mkdir build && cd build && cmake ../ -DCMAKE_BUILD_TYPE=Debug && make -j8 && make install && cd ../..

run ldconfig

run srsran_install_configs.sh user

#run sed -i '/^[rf]/a device_args = "driver=plutosdr,hostname=192.168.2.1"' /root/.config/srsran/enb.conf

#./cell_search_nbiot -b 20

#./cell_search -b 20

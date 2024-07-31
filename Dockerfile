from ubuntu:22.04

run apt-get update

ARG DEBIAN_FRONTEND=noninteractive

run apt-get install -y build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev wget

run apt-get install -y software-properties-common

run add-apt-repository -y ppa:pothosware/framework

run add-apt-repository -y ppa:pothosware/support

run apt-get update

run apt-get install -y pothos-all python3-pothos pothos-python-dev soapysdr-tools osmo-sdr soapysdr-module-osmosdr rtl-sdr soapysdr-module-rtlsdr python3-soapysdr python3-numpy

run wget https://github.com/analogdevicesinc/libiio/releases/download/v0.23/Linux-Ubuntu-20.04-x86_64.tar.gz

run tar -xvf Linux-Ubuntu-20.04-x86_64.tar.gz

run apt-get install -y libaio1 libserialport0

run dpkg -i Linux-Ubuntu-20.04-x86_64/libiio-0.23.g92d6a35-Linux.deb

run add-apt-repository -y ppa:myriadrf/drivers

run apt-get update

run apt-get install -y git

run wget https://github.com/analogdevicesinc/libad9361-iio/releases/download/v0.2/ad9361-0.2-Linux.deb

run dpkg -i ad9361-0.2-Linux.deb

run apt-get install -y libzmq3-dev python3-distutils mc aptitude  bash-completion bash nano swig

run git clone https://github.com/pothosware/SoapySDR.git

run cd SoapySDR && mkdir build && cd build && cmake .. && make -j8 && make install

run ldconfig

run git clone https://github.com/meee1/SoapyPlutoSDR.git

run cd SoapyPlutoSDR && mkdir build && cd build && cmake .. && make -j8 && make install

#cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLIB_INSTALL_DIR:PATH=lib64 -DLIB_SUFFIX=64 -DSOAPY_SDR_ROOT=/usr

run PothosUtil --system-info

run SoapySDRUtil --info

run SoapySDRUtil --find

#run SoapySDRUtil --probe="driver=plutosdr,hostname=192.168.2.1"

run git clone https://github.com/srsRAN/srsRAN.git

run cd srsRAN && mkdir build && cd build && cmake ../ && make -j8

run cd srsRAN && cd build && make install

run ldconfig

run srsran_install_configs.sh user

#run sed -i '/^[rf]/a device_args = "driver=plutosdr,hostname=192.168.2.1"' /root/.config/srsran/enb.conf

#./cell_search_nbiot -b 20

#./cell_search -b 20

CMD bash

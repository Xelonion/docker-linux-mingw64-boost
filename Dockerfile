FROM ubuntu:22.04

WORKDIR /build

RUN apt-get update
RUN apt-get install -y \
  mingw-w64 \
  cmake \
  git \
  zip 

RUN apt-get install -y libz-mingw-w64-dev build-essential gcc g++ \
	binutils-mingw-w64 gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64 gcc-mingw-w64-i686 g++-mingw-w64-i686

RUN git clone https://github.com/libmingw-w64/libboost-mingw-w64.git && \
  cd libboost-mingw-w64/ && \
  git submodule update --init --recursive

RUN  ./libboost-mingw-w64/build.debian.sh || echo "Finished"

RUN  cp -R libboost-mingw-w64/libboost-mingw-w64/lib/* /usr/x86_64-w64-mingw32/lib && \
    cp -R libboost-mingw-w64/libboost-mingw-w64/include/boost /usr/x86_64-w64-mingw32/include

RUN rm -R /build/*






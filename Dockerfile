# docker build -t rtl-tools .

FROM hdlc/formal:all

ARG DEBIAN_FRONTEND=noninteractive 
ENV TZ=Asia/Dubai
ENV LC_ALL=C
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en  

RUN apt-get update && apt-get install -y \
    locales less \
    npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /root/work && cd /root/work && \
    git clone https://github.com/nturley/netlistsvg.git && \
    cd netlistsvg && npm install --legacy-peer-deps  && npm install -g && \
    chmod +rx /root

WORKDIR /prj
CMD bash


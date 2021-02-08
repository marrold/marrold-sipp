
LABEL maintainer="docker@marrold.co.uk"

FROM debian:buster-slim
RUN apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y wget libssl-dev libncurses5-dev libsctp-dev libpcap-dev && \
    apt-get install -y build-essential cmake  && \
    mkdir -p /usr/src && \
    cd /usr/src && \
    wget https://github.com/SIPp/sipp/releases/download/v3.6.1/sipp-3.6.1.tar.gz && \
    tar -xvf sipp-3.6.1.tar.gz && \
    cd sipp-3.6.1 && \
    ./build.sh --full && \
    cp sipp /usr/local/bin

FROM debian:buster-slim
RUN apt-get update  && \
    apt-get upgrade -y && \
    apt-get install -y sngrep libssl-dev libsctp-dev
COPY --from=0 /usr/src/sipp-3.6.1/sipp /usr/local/bin



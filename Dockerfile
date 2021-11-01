FROM ubuntu:18.04

# Setup python and java base system
ENV DEBIAN_FRONTEND noninteractive
ENV LANG=en_US.UTF-8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -q -y openjdk-8-jdk python3-pip android-tools-adb git android-tools-fastboot git libsnappy-dev language-pack-en supervisor

COPY . ./root/

RUN pip3 install -e ./root/
ADD supervisord.conf /etc/supervisor/supervisord.conf
ENTRYPOINT [ "droidbot" ]
CMD ["-h"]

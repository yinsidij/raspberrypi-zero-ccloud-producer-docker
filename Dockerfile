FROM --platform="arm/v5" debian:stable

RUN apt-get -y update && apt-get -y upgrade 
RUN apt-get -y install motion
RUN apt-get -y install libssl-dev
RUN apt-get -y install curl

RUN apt -y install gcc g++ zlib1g-dev librdkafka-dev

RUN mkdir -p /home/pi/ccloud/producer
RUN mkdir -p /home/pi/ccloud/build
COPY src/*.h /home/pi/ccloud/producer/
COPY src/*.c /home/pi/ccloud/producer/


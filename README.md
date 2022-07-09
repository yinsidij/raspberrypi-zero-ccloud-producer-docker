# Raspberrypi-zero-ccloud-producer-dockerr
Docker build for producer client of Confluent Cloud on raspberry pi zero in `debian` OS
This repo provides a way to complie `producer` binary in docker and this allows the output `producer` binary to run in `debian` OS

# Docker Build
`sudo docker build . -t pi-zero-ccloud-debian-image`

# Start Container
`sudo docker run -v `pwd`/build:/home/pi/ccloud/build -it pi-zero-ccloud-debian-image bash`

# Compile `producer` in Docker
```
cd /home/pi/ccloud/producer/
gcc -g -O2 -fPIC -Wall -Wsign-compare -Wfloat-equal -Wpointer-arith -Wcast-align producer.c common.c json.c -o ../build/producer -lrdkafka -lm -lz  -ldl -lcrypto -lssl -lpthread -lrt
```
You are expected to see `producer` binary in your host
```
pi@raspberrypi:~/raspberrypi-zero-ccloud-producer-docker $ file build/producer
build/producer: ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.3, BuildID[sha1]=88f6cbb055f5d5fe444aa52c58e1d07b518c1031, for GNU/Linux 3.2.0, with debug_info, not stripped
```

# Reference
This repo modified producer.c. For original example:

https://github.com/confluentinc/examples/tree/7.1.1-post/clients/cloud/c

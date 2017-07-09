# omega2-checkHumidity

Trying to adapt code (fastgpio) to get [DHT11-DHT22-Sensor-Examples](https://wiki.onion.io/Tutorials/PHP-DHT11-DHT22-Sensor-Examples) working on Omega*2*(+).

## Current state
- Cross-compile in docker compiles
- ERROR on Omega2:
```bash
root@Omega-XXXX:~# ./checkHumidity 20 DHT22
Error loading shared library libstdc++.so.6: No such file or directory (needed by ./checkHumidity)
Error relocating ./checkHumidity: __gxx_personality_v0: symbol not found
Error relocating ./checkHumidity: __cxa_pure_virtual: symbol not found
Error relocating ./checkHumidity: _ZTVN10__cxxabiv117__class_type_infoE: symbol not found
Error relocating ./checkHumidity: _ZTVN10__cxxabiv120__si_class_type_infoE: symbol not found
Error relocating ./checkHumidity: _ZTVN10__cxxabiv121__vmi_class_type_infoE: symbol not found
Error relocating ./checkHumidity: __gxx_personality_v0: symbol not found
```

## How to start cross compile env
```bash
docker run -it --name omega2-sdk-app -v /mysource:/remote jlcs/omega2-sdk bash
cd /lede;make
```
Then edit makefile to point CXX
```make
CXX := /lede/staging_dir/toolchain-mipsel_24kc_gcc-5.4.0_musl/bin/mipsel-openwrt-linux-uclibc-g++
```

## Origin source
- https://wiki.onion.io/Tutorials/PHP-DHT11-DHT22-Sensor-Examples

## Links
- https://github.com/OnionIoT/fast-gpio
- https://community.onion.io/topic/402/programming-in-c-c
- https://community.onion.io/topic/1592/project-docker-omega2-sdk-for-cross-compilation-cmake-support
- http://community.onion.io/topic/1390/dht11-22-checkhumidity-syntax-error



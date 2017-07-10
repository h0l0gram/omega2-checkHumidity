# omega2-checkHumidity

Tried to adapt code (fastgpio) to get [DHT11-DHT22-Sensor-Examples](https://wiki.onion.io/Tutorials/PHP-DHT11-DHT22-Sensor-Examples) working on Omega*2*(+).

## Current state
Works on Omega2 **firmware 0.1.10 b160**

## Install
```bash
root@Omega-1234:~# mkdir checkHumidity && cd checkHumidity
root@Omega-1234:~# wget https://github.com/h0l0gram/omega2-checkHumidity/raw/master/bin/checkHumidity
root@Omega-1234:~# chmod -R 755 checkHumidity
```
## Run
```bash
./checkHumidity <GPIO-PIN> <DHT-TYPE>
GPIO-PIN : 0-19
DHT-TYPE : DHT11 or DHT22

```
## Example
```bash
root@Omega-1234:~# ./checkHumidity 19 DHT22
48.299999
28.299999


```
See https://wiki.onion.io/Tutorials/PHP-DHT11-DHT22-Sensor-Examples

**Hints/improvements welcome!**


## Cross compile env used:
```bash
docker run -it --name omega2-sdk-app -v /mysource:/remote jlcs/omega2-sdk bash
cd /lede;make
```
git clone https://github.com/h0l0gram/omega2-checkHumidity.git /mysource

## Origin tutorial and source
- https://wiki.onion.io/Tutorials/PHP-DHT11-DHT22-Sensor-Examples

## Links
- https://github.com/OnionIoT/fast-gpio
- https://docs.onion.io/omega2-docs/cross-compiling.html
- https://github.com/OnionIoT/OpenWRT-Packages/wiki/Setting-Up-the-Cross-Compile-Environment#step-2-get-openwrt-source
- http://community.onion.io/topic/1390/dht11-22-checkhumidity-syntax-error

## Credits
- Adafruit Industries (original dht_read implementation)
- [Contributors](https://github.com/OnionIoT/fast-gpio/graphs/contributors) of [onion/fast-gpio](https://github.com/OnionIoT/fast-gpio) fastgpioomega2

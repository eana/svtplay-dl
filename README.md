# svtplay-dl

A docker image capable of downloading videos from
[svtplay.se](https://www.svtplay.se).  
This image uses the [svtplay-dl](https://github.com/spaam/svtplay-dl) python
script.

## Build the image

```
TAG=$(curl -s https://api.github.com/repos/spaam/svtplay-dl/tags | jq --raw-output '.[].name' | sort -rV | head -n1)
docker build -t svtplay-dl:${TAG} https://github.com/eana/svtplay-dl.git
```

## How to use this image

```
docker run -it --name svtplay-dl --rm -v $(pwd):/data svtplay-dl:${TAG} svtplay-dl --resume --subtitle --all-episodes https://www.svtplay.se/sos-vilda-djur
```

Note: apparentely in order to download from svtplay we need to use an Swedish
IP addres. Here is a list with
[proxies](http://free-proxy.cz/en/proxylist/country/SE/https/ping/all) which
can be used.

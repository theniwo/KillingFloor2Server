
# Killing Floor 2 dedicated server

Since Killing Floor 2 was free on the Epic Games Store, we wanted to X-Play on our own server. So I built this.
Maybe it is useful to someone else.

Since Killing Floor 2 was free on the Epic Games Store, we wanted to X-Play on our own server. So I built this.
Maybe it is useful to someone else.

## Usage

### Building

```
git clone https://github.com/theniwo/killingfloor2server
cd killingfloor2server
docker build -t theniwo/killingfloor2server:latest .
```

### Startup

```
docker run -d \
 --name killingfloor2server \
 -p 0.0.0.0:7777:7777/udp \
 -p 8080:8080 \
 theniwo/killingfloor2server:latest
```


### Setup

Forward port 7777 if you want the server to be found from outside of your local network.
(Refer to guides like [noip](https://www.noip.com/support/knowledgebase/general-port-forwarding-guide/) on how to forward ports)

Port 8080 is for the webinterface e.g. `http://localhost:8080` or `http://killingfloor2server:8080` and doesn't have to be forwarded,
unless you want to access the webinterface from the internet, too.

### Webinterface
- Open the file `/opt/server/KFGame/Config/KFWeb.ini` either by editing the file in the docker volume or inside the container
(`docker exec -it killingfloor2server bash`)

- Change `bEnabled=false` to `bEnabled=true`

- Restart the Container

### Status

To see the status of your server run

```
docker logs -f killingfloor2server
```

**NOTES**
<!---
  <pre>
  Scrolltext
  </pre>
-->

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Infobox_info_icon.svg/1200px-Infobox_info_icon.svg.png" alt="drawing" width="20">

This version will _not_ be updated regularly. However, I will try to keep [theniwo/steamcmd](https://hub.docker.com/repository/docker/theniwo/steamcmd) updated.

**CONTACT**

[disp@mailbox.org](mailto:disp@mailbox.org)

**LINKS**

[Git Hub](https://github.com/theniwo/killingfloor2server)

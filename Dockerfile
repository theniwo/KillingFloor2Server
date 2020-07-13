FROM sequel7/steamcmd:14.04

# ROOT
USER root
ENV DEBIAN_FRONTEND noninteractive
EXPOSE 8080 7777

RUN apt-get update \
  && apt-get install -y software-properties-common python-software-properties expect tcl

RUN dpkg --add-architecture i386

RUN add-apt-repository ppa:wine/wine-builds \
  && apt-get update \
  && apt-get install -y --install-recommends winehq-staging


# STEAM
USER steam

RUN ./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /opt/server/ +app_update 232130 validate +quit

# Do not change above here

USER root
COPY ./content/ /
USER steam

RUN sed -i s/bEnabled=false/bEnabled=true/ /opt/server/KFGame/Config/KFWeb.ini
#RUN rm /opt/server/KFGame/Config/KFWeb.ini

ENV WINEDEBUG "fixme-all"
CMD /usr/bin/unbuffer wine /opt/server/Binaries/Win64/KFServer.exe kf-bioticslab?difficulty=0?maxplayers=20?adminpassword=SmackMyBitchUp2020 -port=7777

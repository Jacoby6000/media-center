#!/bin/bash

SERVICES=tautulli,plex,sonarr,radarr,jackett,sonarr-anime
for service in ${SERVICES//,/ } ; do
  cp $service/$service.service /etc/systemd/system/
done


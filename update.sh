#!/bin/bash

SERVICES=tautulli,plex,sonarr,radarr,jackett,lidarr
for service in ${SERVICES//,/ } ; do
  docker pull linuxserver/$service
done

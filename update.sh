#!/bin/bash

SERVICES=tautulli,plex,sonarr,radarr,jackett,sabnzbd
for service in ${SERVICES//,/ } ; do
  docker pull linuxserver/$service
done

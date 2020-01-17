#!/bin/bash

SERVICES=tautulli,plex,sonarr,radarr,jackett
for service in ${SERVICES//,/ } ; do
  docker pull linuxserver/$service
done

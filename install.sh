#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Pulling images..."
echo ""
sleep 1

IMAGES=tautulli,plex,sonarr,radarr,jackett
for image in ${IMAGES//,/ } ; do
  docker pull linuxserver/$image
done

echo ""
echo ""
echo "Done pulling images. Linking systemd services and nginx confs."
echo ""
sleep 1

SERVICES=tautulli,plex,sonarr,radarr,jackett,sonarr-anime
for service in ${SERVICES//,/ } ; do
  echo ""
  echo "Linking $service systemd service."

  rm -f /etc/systemd/system/$service.service
  ln -s $DIR/$service/$service.service /etc/systemd/system/

  echo "Configuring nginx for $service."
  rm -f /etc/nginx/sites-available/$service.conf
  ln -s $DIR/$service/$service.conf /etc/nginx/sites-available

  rm -f /etc/nginx/sites-enabled/$service.conf
  ln -s /etc/nginx/sites-available/$service.conf /etc/nginx/sites-enabled/$service.conf

done

echo ""
echo "Reloading nginx configuration"
systemctl reload nginx

echo ""
echo "Done."


#!/bin/sh

cp /github-gitea-mirror/src/config.json /tmp/config.json && jq -r ".github.username |= \"$GITHUB_USERNAME\"|.github.accesstoken |= \"$GITHUB_ACCESSTOKEN\"|.gitea.host |= \"$GITEA_HOST\"|.gitea.accesstoken |= \"$GITEA_ACCESSTOKEN\"|.gitea.username |= \"$GITEA_USERNAME\"|.gitea.default_userpassword |= \"$GITEA_DEFAULT_USERPASSWORD\"" /tmp/config.json > /github-gitea-mirror/src/config.json && rm /tmp/config.json
if [ -n "$PING_URL" ]; then
  echo "$INTERVAL /bin/sh -c 'cd /github-gitea-mirror && python3 mirror.py && curl $PING_URL'" >> /var/spool/cron/crontabs/root
else
  echo "$INTERVAL /bin/sh -c 'cd /github-gitea-mirror && python3 mirror.py'" >> /var/spool/cron/crontabs/root
fi
crond -f

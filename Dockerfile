FROM python:3-alpine

RUN sed -i 's/https/http/' /etc/apk/repositories
RUN apk update
RUN apk add git curl jq
RUN pip3 install PyGithub

RUN git clone https://github.com/varunsridharan/github-gitea-mirror
RUN cp /github-gitea-mirror/src/config.json /tmp/config.json && jq -r '. + {local_cache: {enabled: false}}' /tmp/config.json > /github-gitea-mirror/src/config.json && rm /tmp/config.json
RUN sed -i "s/return 'failed'/exit(1)/" /github-gitea-mirror/src/helper.py

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

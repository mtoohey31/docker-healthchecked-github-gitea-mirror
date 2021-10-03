# `docker-healthchecked-github-gitea-mirror`

[varunsridharan/github-gitea-mirror](https://github.com/varunsridharan/github-gitea-mirror) in a container, as a cronjob with optional [Healthchecks](https://healthchecks.io/) (or equivalent service) pinging.

## Usage

```sh
git clone https://github.com/mtoohey31/healthchecked-docker-github-gitea-mirror
cd healthchecked-docker-github-gitea-mirror
docker build -t "healthchecked-github-gitea-mirror" .
docker run -it \
    -e INTERVAL= \
    -e GITHUB_USERNAME= \
    -e GITHUB_ACCESSTOKEN= \
    -e GITEA_HOST= \
    -e GITEA_USERNAME= \
    -e GITEA_ACCESSTOKEN= \
    -e GITEA_DEFAULT_USERPASSWORD= \
    -e PING_URL= \ # optional
    healthchecked-github-gitea-mirror
```

Recommendation: test your variables with `INTERVAL=@reboot` to start the task immediately, then switch to the desired interval after the first test succeeds.

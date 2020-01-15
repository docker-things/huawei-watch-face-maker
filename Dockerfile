FROM gui-apps-base:18.04
MAINTAINER Gabriel Ionescu <gabi.ionescu+dockerthings@protonmail.com>

ARG APP_ARCHIVE_URL

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        unzip \
        wget \
        libx11-xcb-dev \
        libnss3-dev \
        libxtst6 \
        libxss1 \
        libasound2 \
 \
 && wget "$APP_ARCHIVE_URL" -O /tmp/app.zip \
 && mkdir /app \
 && cd /app \
 && unzip /tmp/app.zip \
 && DIRNAME="`ls`" \
 && mv $DIRNAME/* ./ \
 && rmdir $DIRNAME \
 && chown $DOCKER_USERNAME:$DOCKER_GROUPID -R /app \
 && chmod +x huawei_watch_face_maker \
 \
 && rm -rf /tmp/* \
 && apt-get remove -y \
    unzip \
    wget \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y

# SET USER
USER $DOCKER_USERNAME

# ENTRYPOINT
ENTRYPOINT ["/app/huawei_watch_face_maker", "--no-sandbox"]

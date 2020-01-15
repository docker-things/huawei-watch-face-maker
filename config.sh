#!/bin/bash

# Command used to launch docker
DOCKER_CMD="`which docker`"

# Where to store the backups
BACKUP_PATH=""

# Where to store the communication pipes
FIFO_PATH="/tmp/docker-things/fifo"

# The name of the docker image
PROJECT_NAME="huawei-watch-face-maker"

# Meta to set in the .desktop file
APP_GENERIC_NAME="Watch Face Editor"
APP_CATEGORIES="Development;"
APP_MIME_TYPE=""
APP_PARAM=""

# BUILD ARGS
BUILD_ARGS=(
    --build-arg APP_ARCHIVE_URL="https://doc-0c-ak-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/lfd9scltn9pvhv4t0m0j94e8rv02i3dk/1579082400000/11661470670177043854/*/1d0pGtG6mKITkbMOxaBXdSJnLAmNiIR0l?e=download"
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    -v $XAUTHORITY:/tmp/.Xauthority
    -e XAUTHORITY=/tmp/.Xauthority

    --memory="1g"
    --cpu-shares=1024
    --shm-size 2g

    -v $(pwd)/data/.cache:/home/$(whoami)/.cache
    -v $(pwd)/data/.config:/home/$(whoami)/.config
    -v /home/$(whoami)/watch-faces:/home/$(whoami)/watch-faces

    --rm
    -d
    )

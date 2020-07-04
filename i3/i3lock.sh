#!/bin/bash

# export I3_CONFIG=${HOME}/.config/i3
export WALLPAPERS=/usr/share/backgrounds

random_wallpaper()
{
    WALLPAPER_COUNT=$(find ${WALLPAPERS} -name "*.png" | wc -l)
    RANDOM_NUMBER=$(( ( RANDOM % ${WALLPAPER_COUNT} )  + 1 ))
    export WALLPAPER=$(find ${WALLPAPERS} -name "*.png" | head -n ${RANDOM_NUMBER} | tail -n 1)
}

main()
{
    WP_PATH=$1
    [ ! -z ${WP_PATH} ] && [ -d ${WP_PATH} ] && WALLPAPERS=${WP_PATH}
    random_wallpaper
    CMD="i3lock -i ${WALLPAPER} -t"
    echo ${CMD}
    eval ${CMD}
}

main $@

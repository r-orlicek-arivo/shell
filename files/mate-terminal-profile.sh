#!/bin/bash
PROFILES=`dconf read /org/mate/terminal/global/profile-list`

if [ -z "${PROFILES}" ]; then
    PROFILES="['default','phish']"
elif [[ ${PROFILES} =~ 'phish' ]]; then
    echo "phish already in profile list"
else
    M="'phish']"
    PROFILES=${PROFILES/]/, $M}
fi

dconf write /org/mate/terminal/global/profile-list "${PROFILES}"
dconf write /org/mate/terminal/global/default-profile "'phish'"
dconf load /org/mate/terminal/profiles/phish/ < mate-terminal-profile.dconf

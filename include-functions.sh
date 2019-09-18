#!/bin/bash

################################################################################
#                                                                              #
# include-functions.bash - handy bash functions around the house               #
#                                                                              #
################################################################################

## proxy-on - Enable proxy settings based on the following Environment Vars
#             PROXY_HOST
#             PROXY_PORT
#             PROXY_NONE
#             PROXY_USER
#             PROXY_PASS


function proxy-on() {

    if [[ -n "$PROXY_HOST" ]] ; then

        # authentication is optional
        if [[ -n "$PROXY_USER" && -n "$PROXY_PASS" ]] ; then
            local PROXY_AUTH="${PROXY_USER}:${PROXY_PASS}@"
        fi

        # port is optional ? 
        if [[ -n "$PROXY_PORT" ]] ; then
            local COLON_PORT=":${PROXY_PORT}"
        fi

        local PROXY_STRING="${PROXY_AUTH}${PROXY_HOST}${COLON_PORT}"

        # export all proxy options I know
        export {all,http,https}_proxy="http://${PROXY_STRING}"  # lowercase
        export {ALL,HTTP,HTTPS}_PROXY="http://${PROXY_STRING}"  # UPPERCASE

        # export proxy exclusions (both in lowercase and uppercase)
        if [[ -n "$PROXY_NONE" ]] ; then
            export {NO_PROXY,no_proxy}="${PROXY_NONE}"
        fi

    fi
}

proxy-on

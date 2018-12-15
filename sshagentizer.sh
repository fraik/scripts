#!/bin/bash

TIMEOUT=7200 

agents=()
while read -r ; do
    agents+=("$REPLY")
done < <(find /tmp -type s -user $(id -u) -regex '^/tmp/ssh-[^/]*/agent.[0-9]+$' 2>/dev/null)

# there can be only 1
if [ ${#agents[@]} -eq 1 ] ; then
    export SSH_AUTH_SOCK=${agents[0]}
elif [ ${#agents[@]} -gt 1 ] ; then
    echo "Too many ssh-agents detected, please fix" 
else
    eval $(ssh-agent -t $TIMEOUT)
fi


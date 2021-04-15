#!/bin/bash
set -e
count=1
declare config_file
declare copy
function fetch_configfile() {
    for i in "${@:1}"
    do
        if [[ "$i" == "-c"* ]]; then
            if [[ $i =~ -c=(.+) ]]; then
                eval config_file="${BASH_REMATCH[1]}"
                copy=${@/"$i"}
            elif [[ $i =~ -c(.+) ]]; then
                echo "unacceptable argument : $i"
                exit 1
            else
                eval var='$'$(( count + 1 ))
                eval config_file="$var"
                copy=$(echo "$@" | sed "s/-c//")
                copy=${copy/$config_file}
            fi
        fi
    (( count += 1 ))
    done
}

fetch_configfile "$@"
if [[ ! -z $config_file ]]; then
    export TERRASCAN_CONFIG=$config_file
fi

if [[ -z $copy ]]; then
    atlantis-entrypoint.sh $@
else
    atlantis-entrypoint.sh $copy
fi
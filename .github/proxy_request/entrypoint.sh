#!/bin/bash
set -e

declare -a endpoints=("https://api.appcenter.ms/v0.1/public/apps/8c335981-875d-4037-8618-17de0626dfd2/hooks" "https://smee.io/vHU5WwXJYKEG6ZKR" "https://aaaaa3.nl")

## now loop through the above array
for i in "${endpoints[@]}"
do
   echo "Proxying payload to $i"
   curl --header "Content-Type: application/json" -d "data=@${GITHUB_EVENT_PATH}"  $i
done

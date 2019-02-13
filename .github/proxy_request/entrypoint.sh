#!/bin/bash
declare -a endpoints=(
   "https://smee.io/vHU5WwXJYKEG6ZKR"
   "https://api.appcenter.ms/v0.1/public/apps/8c335981-875d-4037-8618-17de0626dfd2/hooks"
   )

## now loop through the above array
for i in "${endpoints[@]}"
do
   echo "Proxying payload to $i"
   curl --header "Content-Type: application/json" --header "X-GitHub-Delivery: ${RANDOM}" --data-binary "@${GITHUB_EVENT_PATH}" $i
done

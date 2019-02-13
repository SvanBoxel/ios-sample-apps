declare -a endpoints=("https://aaaaa1.nl" "https://aaaaa2.nl" "https://aaaaa3.nl")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Proxying payload to $i"
   curl --header "Content-Type: application/json" -d "{\"value\":\"node JS\"}" $1
done

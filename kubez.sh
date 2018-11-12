#!/bin/bash

###
# Written by David Somers-Harris <david.somers-harris@rakuten.com>

# A better way to do this is written here
# https://stackoverflow.com/a/51289417

verbs="create expose run set explain get edit delete rollout scale autoscale certificate cordon uncordon drain taint apply patch replace wait convert label annotate"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

yes_count=0
total_count=0

echo This script will check your permissions on the following context
echo "(Script repo: https://ghe.rakuten-it.com/david-somers-harris/kubez)"
echo ""
current_context=$(kubectl config view -o json | jq '.["current-context"]')
kubectl config view -o json | jq '.contexts[] | select( .name == '"${current_context}"' )' 

sleep 5


for type in $(kubectl api-resources | awk '{print $1}' | tail -n +2)
do
  echo "${type}"
  for verb in ${verbs}
  do
    result=$(kubectl auth can-i $verb $type)
    case ${result} in
    'yes')
      (( yes_count+=1 ))
      printf "%-15s ${GREEN}%s${NC}\n" ${verb} ${result}
      ;;
    'no')
      printf "%-15s ${RED}%s${NC}\n" ${verb} ${result}
      ;;
    *)
      echo "ERROR"
      exit 1
      ;;
    esac
    (( total_count+=1 ))
  done
  echo ""
done

echo "You have ${yes_count} out of ${total_count} privileges."

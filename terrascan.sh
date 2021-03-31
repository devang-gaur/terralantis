#!/bin/bash

#VARS- Terrascan IP address.


#pwd
#for filename in *.tf; do
    #CHANGE TO LOCAL SCAN IN CONTAINER MODE
#    curl -s -F "file=@$filename" 172.17.112.1:9010/v1/terraform/v14/aws/local/file/scan -o output
#done
#terraform show -json default.tfplan > tfplan.json
terrascan scan -i tfplan --iac-version v1 -f ${PLANFILE}.json -l error > output

#Formatting- create Terrascan block:
sed -i '1s/^/<details><Summary>Terrascan Scan Results<\/Summary>\n\n```diff\n/' output
#Close up original block
sed -i '1s/^/```\n<\/details>\n/' output

cat output
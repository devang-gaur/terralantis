#!/bin/bash

terrascan scan -i tfplan --iac-version v1 -f ${PLANFILE}.json -l error > output

#Formatting- create Terrascan block:
sed -i '1s/^/<details><Summary>Terrascan Scan Results<\/Summary>\n\n```diff\n/' output
#Close up original block
sed -i '1s/^/```\n<\/details>\n/' output

cat output
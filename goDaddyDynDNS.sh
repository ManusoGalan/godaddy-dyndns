#!/bin/bash

domain=<YOUR DOMAIN>
name='@'
key=<THE KEY GIVEN BY GoDaddy (see API)>
secret=<THE SECRET KEY GIVEN BY GoDaddy (see API)>

storedIP=$(curl -s -X GET "https://api.godaddy.com/v1/domains/$domain/records/A/$name" \
	-H "accept:application/json" \
	-H "Authorization: sso-key $key:$secret" | jq '.[].data')
currentIP=$(curl -s https://ipinfo.io/ip)

if [ "$storedIP" != "\"$currentIP\"" ]; then
	echo "Updating registry"

	curl -s -XPUT "https://api.godaddy.com/v1/domains/$domain/records/A" \
	-H "Content-Type:application/json"\
	-H "Authorization: sso-key $key:$secret" \
	-d "[{\"data\": \"$currentIP\", \"name\": \"@\"},{\"data\": \"$currentIP\", \"name\": \"mail\"}]"
fi

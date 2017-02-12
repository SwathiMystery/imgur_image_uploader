#!/bin/bash
# Imgur script to bulk upload the images and get URLs accordingly
# 
# @author Swathi Venkatachala
# Exit on first error
set -e

API_KEY=YOUR_API_KEY
CLIENT_ID=YOUR_CLIENT_ID

die () {
  echo "$1" >&2
  exit 1
}

function parse_url_from_response {
	echo "$1" | sed -E 's/.*"link":"([^"]+)".*/\1/' | sed "s|\\\\/|/|g"
}

function upload {
		echo "$1"
		response=$(curl -H "Authorization: Client-ID $CLIENT_ID" -H "Expect: " -F "image=@$1" https://api.imgur.com/3/image 2>/dev/null)             

		url=$(parse_url_from_response "$response")
		# echo $i,$url
        echo $1,$url >> imgur.csv
}

rm -rf imgur.csv

echo "Uploading the images"
 for i in "$@"; do
 		echo "Uploading $i / $@"
		upload $i
 done

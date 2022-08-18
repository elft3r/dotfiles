#!/bin/bash
light_call_body() {
cat <<EOF
{
	"numberOfLights":1,
	"lights": [
		{
			"on": 1,
			"brightness": 21,
			"temperature":294
		}
	]
}
EOF
}

light_day_body() {
cat <<EOF
{
	"numberOfLights":1,
	"lights": [
		{
			"on": 1,
			"brightness": 30,
			"temperature":175
		}
	]
}
EOF
}

light_off_body() {
cat <<EOF
{
	"numberOfLights":1,
	"lights": [
		{
			"on": 0,
			"brightness": 21,
			"temperature":294
		}
	]
}
EOF
}

update_key_light() {
	BODY=$1

	curl -i \
		-H "Accept: application/json" \
		-H "Content-Type: application/json" \
		-X PUT \
		--data "$BODY" \
		"http://192.168.1.5:9123/elgato/lights"
}

elgato_light_call() {
	update_key_light "$(light_call_body)"
}

elgato_light_day() {
	update_key_light "$(light_day_body)"
}

elgato_light_off() {
	update_key_light "$(light_off_body)"
}

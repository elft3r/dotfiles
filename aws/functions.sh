#!/bin/bash

ecr_docker_login() {
	URL=https://$(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com
	USERNAME=AWS

	echo $(aws ecr get-login-password)|docker login --password-stdin --username ${USERNAME} ${URL}
}

set_aws_env_variables() {
	PROFILE=$1

	export AWS_ACCESS_KEY_ID=$(aws configure get ${PROFILE}.aws_access_key_id)
	export AWS_SECRET_ACCESS_KEY=$(aws configure get ${PROFILE}.aws_secret_access_key)
	export AWS_DEFAULT_REGION=$(aws configure get ${PROFILE}.region)
}

parse_aws_csv() {
	FILE=$1

	AWS_KEY_ID=$(sed '2q;d' $FILE | cut -d',' -f1)
	AWS_KEY=$(sed '2q;d' $FILE | cut -d',' -f2)

	export AWS_ACCESS_KEY_ID="$AWS_KEY_ID"
	export AWS_SECRET_ACCESS_KEY="$AWS_KEY"
	export AWS_DEFAULT_REGION="us-east-1"
}

aws_export_profile() {
	# parse the aws config file and show the profiles
	items=(`cat ~/.aws/config | grep "\[profile" | sed 's/\[profile \([^"]*\).*\]/\1/' | awk '{printf("%s ",$0)} END { printf "\n" }'`)

	tmp=$COLUMNS
	COLUMNS=40
	PS3='Which AWS profile to export: '
	select profile in ${items[@]}
	do
		export AWS_PROFILE=$profile
		break
	done

	COLUMNS=$tmp
}

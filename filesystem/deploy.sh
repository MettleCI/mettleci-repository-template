#!/bin/sh

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Validate input arguments
# 
USAGE="${0} syntax:
-p <project name> -e <environment>"

while getopts e:p: OPT
do
    case $OPT in
    p)  PROJECT_NAME=${OPTARG} ;;
    e)  ENV_NAME=${OPTARG} ;;
    ?)  echo ${USAGE}
        exit -1 ;; 
    esac
done

# Environment required
if [ "${ENV_NAME}x" = "x" ]; then
    echo "ERROR: Parameter <environment> is required.\n${USAGE}";
    exit -1;
fi

# Project required
if [ "${PROJECT_NAME}x" = "x" ]; then
    echo "ERROR: Parameter <project name> is required.\n${USAGE}";
    exit -1;
fi
#------------------------------------------------------------------------------

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Deploy filesystem assets
#

mkdir -p /data/project/$PROJECT_NAME/datasets

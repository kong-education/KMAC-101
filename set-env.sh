#!/bin/bash

source ~/.bashrc

export KONGHOSTNAME=${STRIGO_RESOURCE_DNS}

export PROXY_URL=http://$KONGHOSTNAME:31112
export KONG_MESH_GUI==http://$KONGHOSTNAME:31112
export KUMA_MESH_GUI_URI=http://$KONGHOSTNAME:30001
export GRAFANA_DASHBOARD=http://$KONGHOSTNAME:30004
export KONG_MESH_URI=http://$KONGHOSTNAME:30001
export KONG_MESH_GUI_URI=$KONG_MESH_URI/gui

export PUBLICIP=$(curl -s http://checkip.amazonaws.com)
# export KONG_LICENSE_DATA=$(cat /usr/local/kong/license.json)
export KONG_MESH_DEMO=http://$KONGHOSTNAME:8080
export KONG_DEMO_PROXY=http://$KONGHOSTNAME:31112

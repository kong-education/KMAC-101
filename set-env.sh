#!/bin/bash

source ~/.bashrc
export PROXY_URL=http://$STRIGO_RESOURCE_DNS:31112
export KONG_MESH_GUI==http://$STRIGO_RESOURCE_DNS:31112
export KUMA_MESH_GUI_URI=http://$STRIGO_RESOURCE_DNS:30001
export GRAFANA_DASHBOARD=http://$STRIGO_RESOURCE_DNS:30004
export KONG_MESH_GUI=http://$STRIGO_RESOURCE_DNS:30001

export PUBLICIP=$(curl -s http://checkip.amazonaws.com)
export KONG_LICENSE_DATA=$(cat /usr/local/kong/license.json)

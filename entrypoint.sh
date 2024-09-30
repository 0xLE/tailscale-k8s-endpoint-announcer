#!/usr/bin/env bash

set -e
set -x

routes=$(kubectl get nodes "$KUBE_NODE_NAME" -o jsonpath='{.spec.podCIDR}')

if [ -z "$TS_ADDITIONAL_ROUTES" ]; then
  routes="$routes,$TS_ADDITIONAL_ROUTES"
fi

tailscale set --advertise-routes="$routes"

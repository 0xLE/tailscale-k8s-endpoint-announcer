#!/usr/bin/env bash

set -e
set -x

cidr=$(kubectl get nodes "$KUBE_NODE_NAME" -o jsonpath='{.spec.podCIDR}')
tailscale set --advertise-routes="$cidr"

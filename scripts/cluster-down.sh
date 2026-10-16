#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="llm-lab"

if kind get clusters | grep -q "^${CLUSTER_NAME}$"; then
  echo "Deleting cluster '${CLUSTER_NAME}'..."
  kind delete cluster --name "${CLUSTER_NAME}"
else
  echo "Cluster '${CLUSTER_NAME}' does not exist."
fi

#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="llm-lab"
CONFIG="infra/kind/kind-config.yaml"

if kind get clusters | grep -q "^${CLUSTER_NAME}$"; then
  echo "Cluster '${CLUSTER_NAME}' already exists."
else
  echo "Creating cluster '${CLUSTER_NAME}'..."
  kind create cluster --config "${CONFIG}"
fi

echo
kubectl cluster-info
echo
kubectl get nodes

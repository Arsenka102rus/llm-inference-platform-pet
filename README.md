# llm-inference-platform-pet

A hands-on lab for practicing LLM Infrastructure and MLOps:
deploying inference on Kubernetes, a unified gateway, observability,
and a RAG layer with access control.

This is a learning sandbox, not production software. Goal: touch every
piece of the stack end-to-end and document real measurements.

## Stack

- Kubernetes (kind) + Helm
- vLLM — inference server (OpenAI-compatible API)
- LiteLLM — gateway: auth, quotas, logging, guardrails
- Prometheus + Grafana + DCGM exporter — GPU and latency monitoring
- Argo CD — GitOps
- RAG: Qdrant + local embeddings, with per-user access filtering

## Status

- [x] Repository scaffold
- [ ] kind cluster
- [ ] vLLM deployment
- [ ] LiteLLM gateway
- [ ] Monitoring stack
- [ ] GitOps with Argo CD
- [ ] RAG pipeline with ACL

## Repository layout

| Path | Purpose |
|------|---------|
| `docs/` | Architecture diagrams, notes, screenshots |
| `infra/kind/` | kind cluster config |
| `infra/helm/` | Helm charts and per-environment values |
| `infra/argocd/` | Argo CD Application manifests |
| `inference/vllm/` | vLLM configs and manifests |
| `inference/litellm/` | LiteLLM config, guardrails |
| `monitoring/` | Prometheus, Grafana, DCGM |
| `rag/` | RAG pipeline: ingestion and retrieval |
| `scripts/` | Helper scripts (setup, benchmark, deploy) |
| `benchmarks/` | Load-test scripts and results |
| `models/` | Symlinks/configs only — weights live outside the repo |

## Quick start

Will be filled in as components are added.

## Benchmarks

Will be filled in after the first load tests. Target metrics:
throughput (RPS), TTFT, TPOT, p95 latency, tokens/s.

## Observability

Grafana dashboards and alert rules will live in `monitoring/`.

## Security notes

- Access to the inference server only through LiteLLM, never direct
- Secret and PII stripping at the gateway
- RAG results filtered by the caller's access level
- RBAC, service accounts, and NetworkPolicies in the cluster

## Roadmap

- [ ] KServe for online inference
- [ ] MLflow + MinIO for model registry and artifacts
- [ ] Airflow / Argo Workflows for batch jobs

## License

MIT — see LICENSE
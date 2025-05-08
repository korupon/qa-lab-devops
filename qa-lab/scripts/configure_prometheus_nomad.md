# Prometheus Configuration for Nomad

1. Install Prometheus on your Nomad nodes.
2. Add the following job to Prometheus config:

```yaml
- job_name: 'nomad'
  static_configs:
    - targets: ['localhost:4646']
```

3. Add alert rules for failed jobs:

```yaml
- alert: NomadJobFailure
  expr: nomad_job_summary_failed > 0
  for: 5m
  labels:
    severity: critical
  annotations:
    summary: "Nomad job failure detected"
    description: "Job {{ $labels.job }} has failed tasks."
```
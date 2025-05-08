# Using Vault with Nomad

1. Enable the Vault integration in Nomad config.
2. Assign policies to Nomad jobs to fetch secrets.
3. In Nomad HCL job file, use:

```hcl
vault {
  policies = ["qa-policy"]
}

template {
  data = <<EOH
    export DB_PASSWORD="{{ with secret "secret/data/db" }}{{ .Data.data.password }}{{ end }}"
  EOH
  destination = "secrets/env.sh"
  env = true
}
```
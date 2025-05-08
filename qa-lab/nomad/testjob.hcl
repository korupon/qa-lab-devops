job "test-job" {
    datacenters = ["dc1"]
    type = "batch"

    task "test" {
        driver = "docker"
        config {
            image = "test-runner:latest"
            command = "/tests/run_tests.sh"
        }

        resources {
            cpu    = 500 # MHz
            memory = 512 # MB
        }
    }
}

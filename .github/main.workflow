workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "Docker Registry" {
  uses = "actions/docker/login@6495e70"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD", "DOCKER_REGISTRY_URL"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@6495e70"
  needs = ["Docker Registry"]
}

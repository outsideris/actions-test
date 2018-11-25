workflow "New workflow" {
  on = "push"
  resolves = [
    "GitHub Action for Docker",
    "GitHub Action for npm",
  ]
}

action "Docker Registry" {
  uses = "actions/docker/login@6495e70"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD", "DOCKER_REGISTRY_URL"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@6495e70"
  needs = ["Docker Registry"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@95c1a3b"
}

action "GitHub Action for npm" {
  uses = "actions/npm@33871a7"
  needs = ["Filters for GitHub Actions"]
}

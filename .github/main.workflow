workflow "On push" {
  on = "push"
  resolves = ["Proxy payload on push"]
}

workflow "On pull" {
  on = "pull_request"
  resolves = ["Proxy payload on pull"]
}

workflow "On create" {
  on = "create"
  resolves = ["Proxy payload on create"]
}

workflow "On delete" {
  on = "delete"
  resolves = ["Proxy payload on delete"]
}

action "Proxy payload on delete" {
  uses = "./.github/proxy_request"
}

action "Proxy payload on push" {
  uses = "./.github/proxy_payload"
}

action "Proxy payload on pull" {
  uses = "actions/bin/filter@46ffca7632504e61db2d4cb16be1e80f333cb859"
  runs = "./.github/proxy_payload"
}

action "Proxy payload on create" {
  uses = "./.github/proxy_payload"
}

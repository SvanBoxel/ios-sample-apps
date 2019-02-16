workflow "On push" {
  resolves = ["Proxy payload on delete"]
  on = "push"
}

action "Proxy payload on delete" {
  uses = "./.github/proxy_request"
}

action "Proxy payload on push" {
  uses = "./.github/proxy_request"
}

action "Proxy payload on pull" {
  uses = "actions/bin/filter@46ffca7632504e61db2d4cb16be1e80f333cb859"
  runs = "./.github/proxy_payload"
}

action "Proxy payload on create" {
  uses = "./.github/proxy_payload"
}

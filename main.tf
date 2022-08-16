provider "aws" {
}

resource "null_resource" "webhook" {

  provisioner "local-exec" {
    command = <<EOH
    curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token ${var.git_hub_token}" \
  https://api.github.com/repos/${var.git_hub_user}/${var.git_hub_repo}/hooks \
  -d '{"name":"web","active":true,"events":["push"],"config":{"url":"http://${var.ip}:8080/github-webhook/","content_type":"json","insecure_ssl":"0"}}'
EOH
  }

  provisioner "local-exec" {
    when    = destroy
    command = "./web-hook-delete.sh"
  }
}

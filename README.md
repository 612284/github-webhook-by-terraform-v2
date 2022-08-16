# GitHub web hook using terraform
This code helps to create a webhook on GitHub. I used this code in AWS when up Jenkins. Curl, jq, terraform programs must be installed in the system before running terraform apply. Also, you need to create 2 files terraform.tfvars and secret.sh with your credentials.

terraform.tfvars must contain next variables
```
git_hub_repo_web_hook = "https://api.github.com/repos/<USER>/<REPO>/hooks"
git_hub_token         = "ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
git_hub_user          = "USER"
git_hub_repo          = "REPO"
ip                    = "XXX.XXX.XXX.XXX"
```
secret.sh must look like this
```
#!/bin/bash
export git_hub_token=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export git_hub_user=USER
export git_hub_repo=REPO
```
This code creates one webhook after the command "terraform apply" and deletes all webhooks in your repo after the command "terraform destroy"

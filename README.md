# INIT
```
terraform init  -backend-config="access_key=$SPACES_ACCESS_TOKEN" -backend-config="secret_key=$SPACES_SECRET_KEY"
```
# CREATE VM
```
terraform apply  -var-file="user1.tfvars"
cat /var/log/cloud-init-output.log
```
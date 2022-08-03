$tag = Get-Random

$image = -join("gcr.io/nickname-tf-run/nickname:",$tag)

terraform init
terraform plan  -var=image=$image
terraform apply -auto-approve -var=image=$image
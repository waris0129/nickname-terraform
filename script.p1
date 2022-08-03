$tag = -join (((48..57)+(65..90)+(97..122)) * 80 |Get-Random -Count 12 |%{[char]$_})

$image = -join("gcr.io/nickname-tf-run/nickname:",$tag)

terraform init
terraform plan  -var=image=$image
terraform apply -auto-approve -var=image=$image
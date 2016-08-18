# Docker Image for Terraform

## What is terraform

Terraform provides a common configuration to launch infrastructure — from physical and virtual servers to email and DNS providers. Once launched, Terraform safely and efficiently changes infrastructure as the configuration is evolved.

Simple file based configuration gives you a single view of your entire infrastructure.

https://www.terraform.io/

How to use this image

```
docker run --rm codecentric/terraform:0.7.0 [--version] [--help] <command> [<args>]
docker run -e TERRAFORM_BUCKET=codecentric \
           -e TERRAFORM_STATE_FILE=big-data-group-dcos-cluster.tfstate \
           -e AWS_ACCESS_KEY_FILE=/access_key \
           -e AWS_SECRET_KEY_FILE=/secret_key \
           -v ~/.aws/AWS_ACCESS_KEY:/access_key \
           -v ~/.aws/AWS_SECRET_ACCESS_KEY:/secret_key \
           -v ~/development/busfloatingdata/terraform:/project \
           -w /project \
           codecentric/terraform:0.7.0 apply
```

## Using

Please note: Create by your Terraform configuration files (.tf) is /data directory

terraform apply
```
docker run --rm -v /data:/data codecentric/terraform apply [options]
```

terraform destroy

```
docker run --rm -v /data:/data codecentric/terraform destroy [options] [DIR]
```

terraform get

```
docker run --rm -v /data:/data codecentric/terraform get [options] PATH
```

terraform graph

```
docker run --rm -v /data:/data codecentric/terraform graph [options]
```

terraform init

```
docker run --rm -v /data:/data codecentric/terraform init [options] SOURCE [PATH]
```

terraform output

```
docker run --rm -v /data:/data codecentric/terraform output [options] NAME
```

terraform plan

```
docker run --rm -v /data:/data codecentric/terraform plan [options]
```

terraform push

```
docker run --rm -v /data:/data codecentric/terraform push [options]
```

terraform refresh

```
docker run --rm -v /data:/data codecentric/terraform refresh [options]
```

terraform remote

```
docker run --rm -v /data:/data codecentric/terraform remote [options]
```

terraform show

```
docker run --rm -v /data:/data codecentric/terraform show terraform.tfstate [options]
```

terraform taint

```
docker run --rm -v /data:/data codecentric/terraform taint [options] name
```
terraform version

```
docker run --rm codecentric/terraform version
```

Authors

    Bernd Zuther (bernd.zuther@codecentric.de)

License

This project is licensed under the terms of the Apache License, Version 2.0.

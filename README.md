# Terraform AWS Deployment

This project uses Terraform to deploy two environments (develop and qa) on AWS. In each environment, an EC2 instance with an associated security group is created, and NGINX is installed on the instance.

### Project Structure

```bash
.
├── nginx_server_modules
│ ├── 00.variables.tf
│ ├── 01.provider.tf
│ ├── 02.ec2.tf
│ ├── 03.key.tf
│ ├── 04.sg.tf
│ └── 05.output.tf
├── main.tf
└── README.md
```

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) 0.12+
- Configured AWS credentials

## Usage

1. Clone the repository.

    ```bash
    git clone https://github.com/your-username/your-repository.git
    cd your-repository
    ```

2. Initialize Terraform.

    ```bash
    terraform init
    ```

3. Review the execution plan.

    ```bash
    terraform plan
    ```

4. Apply the plan to create the resources.

    ```bash
    terraform apply
    ```
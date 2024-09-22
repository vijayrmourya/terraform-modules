Here's an updated **README** for your Terraform project that includes references to the sample usage repositories:

---

### README for Terraform AWS EC2 Instance Module

---

# Terraform AWS EC2 Instance with Dynamic Security Groups and Key Pair Management

This Terraform module provisions an **AWS EC2 instance** (Linux or Windows) with associated **security groups**, **key pair management**, and optionally retrieves the Windows password (if applicable). It dynamically sets up a private key using the `tls_private_key` resource and automatically configures security rules for both ingress and egress traffic.

## Features

- Provisions an EC2 instance (Windows/Linux).
- Automatically generates a key pair using the `tls_private_key` resource.
- Dynamically creates security groups and rules for the instance.
- Supports user data scripts for instance initialization.
- Retrieves the Windows password for Windows instances.
- Outputs useful information like the EC2 instance ID, public IP, private key path, and more.

## Resources Used

1. **EC2 Instance (`aws_instance`)**:
   - Dynamically provisions an EC2 instance with the necessary configurations such as AMI, instance type, key pair, and more.

2. **TLS Private Key (`tls_private_key`)**:
   - Generates an RSA private key to be used with the EC2 instance.

3. **Key Pair (`aws_key_pair`)**:
   - Associates the public key from the generated private key with the EC2 instance.

4. **Local File (`local_file`)**:
   - Stores the private key locally for later use.

5. **Security Group (`aws_security_group`)**:
   - Creates security groups with dynamic ingress and egress rules.

---

## Prerequisites

- **Terraform**: Make sure Terraform is installed. You can download it from [here](https://www.terraform.io/downloads.html).
- **AWS Account**: You need AWS credentials set up. You can configure them with the AWS CLI by running:
  ```bash
  aws configure
  ```

---

## Variables

| Variable Name                             | Description                                                | Type   | Default Value |
|-------------------------------------------|------------------------------------------------------------|--------|---------------|
| `platform_type`                           | The platform type: `Windows` or `Linux`                    | string |               |
| `ami_id`                                  | AMI ID to use for the EC2 instance                         | string |               |
| `instance_type`                           | Instance type (e.g., `t2.micro`, `t3.medium`)               | string |               |
| `associate_public_ip_address_setting`     | Whether to associate a public IP address with the instance  | bool   |               |
| `user_data_script_path`                   | Path to the user data script                               | string |               |
| `security_group_name`                     | Name of the security group                                 | string |               |
| `security_group_description`              | Description of the security group                          | string | "Security group managed by Terraform" |
| `vpc_id`                                  | VPC ID where the security group will be created             | string |               |
| `ingress_rules`                           | List of ingress rules (port, protocol, CIDR blocks, etc.)   | list   | `[]`          |
| `egress_rules`                            | List of egress rules (port, protocol, CIDR blocks, etc.)    | list   | `[]`          |
| `tls_private_key_algorithm`               | Algorithm for the TLS private key (`RSA`)                  | string |               |
| `tls_private_key_rsa_bits`                | Number of RSA bits for the private key (2048 or 4096)       | string |               |
| `aws_key_pair_key_name`                   | The name for the AWS Key Pair                              | string |               |
| `local_file_private_key_filename`         | The path where the private key will be stored locally       | string |               |
| `local_file_private_key_file_permission`  | File permission for the private key                        | string |               |
| `instance_tags`                           | Tags to apply to the instance                              | map    | `{}`          |
| `sg_tags`                                 | Tags to apply to the security group                        | map    | `{}`          |

---

## Outputs

| Output Name           | Description                               |
|-----------------------|-------------------------------------------|
| `key_pair_name`        | The name of the generated key pair        |
| `private_key_path`     | Path to the private key file              |
| `instance_id`          | ID of the created EC2 instance            |
| `instance_public_ip`   | Public IP address of the instance         |
| `private_key_out_path` | Path to the output private key file       |
| `windows_password`     | Decrypted Windows password if applicable  |

---

## Usage

You can find sample usage of this module for **Ubuntu** and **Windows** in the following repositories:

- **Ubuntu**: [dev-desktop-ubuntu](https://github.com/vijayrmourya/dev-desktop-ubuntu)
- **Windows**: [dev-desktop-windows](https://github.com/vijayrmourya/dev-desktop-windows)

To use this module in your project, follow these steps:

### 1. Clone the Repository

```bash
git clone https://github.com/vijayrmourya/terraform-modules.git
cd terraform-modules/instance_with_key_pair
```

### 2. Initialize Terraform

```bash
terraform init
```

This command downloads the necessary providers and sets up your Terraform environment.

### 3. Set Your Variables

Customize the variables in the `variables.tf` file, or create a `terraform.tfvars` file with the following content:

```hcl
platform_type = "Linux"
ami_id = "ami-0abcdef1234567890"
instance_type = "t2.micro"
associate_public_ip_address_setting = true
user_data_script_path = "./user_data.sh"
security_group_name = "my-security-group"
vpc_id = "vpc-0a1b2c3d4e"
ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
```

### 4. Apply Terraform Configuration

Run the following command to provision the resources:

```bash
terraform apply
```

Confirm the changes when prompted.

### 5. Access EC2 Instance

- **Linux**: Use the generated private key to SSH into the EC2 instance:
  ```bash
  ssh -i path-to-private-key.pem ec2-user@instance-public-ip
  ```

- **Windows**: If `platform_type` is set to `Windows`, you can retrieve the Windows password with the following command:
  ```bash
  terraform output windows_password
  ```

---

## Cleaning Up

To destroy the resources created by this Terraform configuration:

```bash
terraform destroy
```

---

## Important Notes

- Ensure that your **VPC ID** and **subnet** configurations are correct.
- If using a Windows instance, make sure to properly configure `get_password_data` to retrieve the Windows password securely.
- Adjust security group rules (ingress/egress) to match your security requirements.

---

## License

This project is open-source and available under the [MIT License](LICENSE).

---

**Happy Terraforming!** 🌍
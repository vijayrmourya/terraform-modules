# 🛠️ AWS EC2 Instance Module with SSH Key and Security Group

This Terraform module automates the provisioning of an **AWS EC2 instance** with a **dedicated SSH key** for secure access. It also provides the flexibility to configure **custom security group rules**, allowing multiple ingress and egress rules based on your specific requirements.

The module handles the generation and distribution of the SSH private key, ensuring you can securely SSH into the provisioned EC2 instance right from your local environment.

---

### ✨ Key Features

- **EC2 Instance with SSH Access**: Automatically provisions an AWS EC2 instance and assigns a generated SSH key pair for secure remote access.
- **Private Key Distribution**: Retrieves and stores the private key locally, enabling seamless SSH access to the instance.
- **Customizable Security Group**: Supports the configuration of multiple ingress and egress rules, allowing you to define precise network access control for your instance.
- **Scalable and Flexible**: Easily adaptable to different use cases, from development environments to production-ready setups.

---

### 📘 Example Use Case

For a practical implementation of this module, check out the following use case where it is used to provision a remote development environment: [Dev Desktop Use Case Sample](https://github.com/vijayrmourya/dev-desktop-setup).

---

### 📝 How to Use This Module

1. **Clone the repository** containing this module.
2. Integrate the module into your Terraform configuration, supplying the necessary inputs as described in the module’s `README.md`.
3. Customize security group rules by defining the desired ingress and egress settings.
4. Run your Terraform deployment to provision the EC2 instance and securely access it via SSH.

---

### 🤝 Contributions and Feedback

Contributions are welcome! If you have ideas for improvements or additional features, feel free to open an issue or submit a pull request. You can also reach out to me directly at [vijayrmourya@gmail.com](mailto:vijayrmourya@gmail.com).

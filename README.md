# Terraform Proxmox Virtual Machine Template

This repository contains a Terraform module that serves as a template for provisioning and managing virtual machines in Proxmox using Terraform. It provides an easy and efficient way to generate and update virtual machines on the Proxmox platform.

## Prerequisites

Before using this Terraform template, ensure that you have the following prerequisites installed:

- Terraform (version 0.14 or above)
- Proxmox Virtual Environment


## Github Actions 
There is a github actions workflow in place that you can use to generate the Vm's

### Requirements
The workflow uses terraform with remote state currently that is Aws DynamoDB
To access the internal pve it also uses tailscale.

## Getting Started

To get started with this template, follow these steps:

1. Clone this repository to your local machine or download the ZIP file.
2. Configure the Proxmox provider in your Terraform configuration file (e.g., `main.tf`). Make sure to provide the necessary authentication details and connection information.
3. Customize the desired configuration for your virtual machines in the `vmdetails.auto.tfvars` file. You can adjust various parameters such as VM name, CPU, memory, storage, network, etc.
4. Optionally, modify the `main.tf` file to customize any additional resources you require (e.g., networks, storage, templates).
5. Initialize the Terraform configuration by running `terraform init` in the repository's root directory.
6. Review the plan by executing `terraform plan` to see the changes that will be applied.
7. Apply the changes by running `terraform apply`. Confirm the changes when prompted.



## Variables

The following variables are available for customization in the `vmdetails.auto.tfvars` file:

- `#proxmox_api_url = ""`: Your Proxmox IP Address (Commented out as we are using the environment variable)
- `#proxmox_api_token_id = ""`: API Token ID (Commented out as we are using the environment variable)
- `target_node="pve"`: Replace with the node name (Default is pve)
- `vm_name="test-vm"`: Replace with the VM name (Make sure this name is unique)
- `cores=2`: Number of cores (Default is 2)
- `memory=4096`: Memory in MB (Default is 4096)
- `disk_size="20G"`: Disk size in GB (Default is 20G)
- `network_tag = 5`: Replace with network tag (Default is 5)
- `cloneTemplate = "UbuntuTemp"`: Replace with template name (Default is UbuntuTemp). Make sure this template exists
- `ipconfig0="ip=10.1.5.188/24,gw=10.1.5.1"`: Replace with new IP (Replace with requested IP)
- `ciuser="absentadmin"`: Replace with new username if needed (Default is absentadmin)
- `#cipassword = ""`: If you want to set a password, uncomment this line and replace with password
- `#proxmox_api_token_secret = ""`: If you want to use a token secret, uncomment this line and replace with token secret
- `vmid = 5000`: VM ID (Default is -1 - Terraform will set this)
- `vm_description = "Terraform Test VM"`: Description of VM (Default is Terraform Test VM)
- `tags = "terraform, test, demo"`: Comma-separated list of tags
- `#pool = "Terraform"`: Make sure this pool exists


Feel free to modify or add additional variables based on your specific requirements.

## Contribution

Contributions to this Terraform template are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This Terraform template is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as per your needs.

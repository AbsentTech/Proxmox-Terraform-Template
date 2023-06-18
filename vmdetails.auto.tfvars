#proxmox_api_url = ""  # Your Proxmox IP Address Commented out as we are using the environment variable
#proxmox_api_token_id = ""  # API Token ID Commented out as we are using the environment variable
target_node="pve" # Replace with node name (Default is pve)
vm_name="test-vm" # Replace with VM name (Make sure this name is unique)
cores=2 # Number of cores (Default is 2)
memory=4096 # Memory in MB (Default is 4096)
disk_size="20G" # Disk size in GB (Default is 20G)
network_tag = 5 # Replace with network tag (Default is 5)
cloneTemplate = "UbuntuTemp" # Replace with template name (Default is UbuntuTemp) Make sure this template exists
ipconfig0="ip=10.1.5.188/24,gw=10.1.5.1" # Replace with new IP (Replace with requested IP)
ciuser="absentadmin" # Replace with new username if needed (Default is absentadmin)
#cipassword = "" If you want to set a password, uncomment this line and replace with password
#proxmox_api_token_secret = "" If you want to use a token secret, uncomment this line and replace with token secret
vmid = 5000  # VM ID (Default is -1 - Terraform will set this)
vm_description = "Terraform Test VM" # Description of VM (Default is Terraform Test VM) Using Markdown if necessary
tags = "terraform, test, demo" # Comma separated list of tags
#pool = "Terraform" Make sure this pool exists
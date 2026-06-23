terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "2.2.2"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = "us-south"
}

data "ibm_container_vpc_cluster" "repro_bug" {
  name              = "d8si30od0eu8f9tqla7g" 
  resource_group_id = "8ae6fa31f43148ef9919fd1d35eefcfe" # Your resource group ID from CLI
  wait_till         = "Normal"
  wait_till_timeout = 90
}

output "bug" {
  value     = data.ibm_container_vpc_cluster.repro_bug
  sensitive = true
}

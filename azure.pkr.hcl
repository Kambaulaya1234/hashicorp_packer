source "azure-arm" "ubuntu" {
  client_id       = var.client_id
  subscription_id = var.subscription_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  // Specify either a 
  // VHD (storage_account and resource_group_name), 
  // Managed Image (managed_image_resource_group_name and managed_image_name) or 
  // Shared Image Gallery (shared_image_gallery_destination) output (Managed Images can also be published to Shared Image Galleries)

  //---------------------
  // VHD configuration will put the image in storage account

  //resource_group_name = var.resource_group_name
  //storage_account     = var.storage_account
  //capture_container_name = "images"
  //capture_name_prefix    = var.capture_name_prefix
  //---------------------

  //---------------------
  // Managed Image configuration will not need the storage account. It will store the image under resource group
  managed_image_resource_group_name = var.resource_group_name
  managed_image_name                = "${var.image_name}-${var.image_version}"
  //---------------------
  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "UbuntuServer"
  image_sku       = var.image_sku

  location = var.location
  vm_size  = var.vm_size
  azure_tags = {
    project = "e2esademo"
  }


}

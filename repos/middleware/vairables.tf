variable "location" {
  description = "The Allowed Azure region to deploy resources"
  type        = string
  default     = "westus"

  validation {
    condition     = contains(["eastus", "centralus"], var.location)
    error_message = "The specified location is not allowed. Please use 'central us'or 'eastus'."
  }
}
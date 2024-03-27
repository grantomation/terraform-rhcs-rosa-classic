variable "openshift_version" {
  type        = string
  default     = "4.14.9"
  description = "Desired version of OpenShift for the cluster, for example '4.1.0'. If version is greater than the currently running version, an upgrade will be scheduled."
  validation {
    condition     = can(regex("^[0-9]*[0-9]+.[0-9]*[0-9]+.[0-9]*[0-9]+$", var.openshift_version))
    error_message = "openshift_version must be with structure <major>.<minor>.<patch> (for example 4.13.6)."
  }
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster. After the creation of the resource, it is not possible to update the attribute value."
}

variable "token" {
  type        = string
  description = "The token to use for authenticating with the OpenShift cluster."
}

variable "url" {
  type        = string
  description = "The URL of the OpenShift cluster."
  default = "https://api.openshift.com"
}
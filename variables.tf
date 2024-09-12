variable "project_id" {
    default = "senacor-hack-and-heat-2024"
    description = "The project id of the GCP project."
}

variable "disk" {
    type = string
    default = "floriansdisk"
}

variable "instance" {
    type = string
    default = "florianinstance"
}
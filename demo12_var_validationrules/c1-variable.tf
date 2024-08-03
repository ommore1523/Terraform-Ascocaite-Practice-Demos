variable "tagname" {
  type = string
  validation {
    condition = length(var.tagname) < 4
    error_message = "===> tag name should be less the 4 charactors"
  }
}
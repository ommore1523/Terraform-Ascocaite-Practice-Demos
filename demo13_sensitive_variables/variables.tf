
/*
Quetions:
   How do you define secretes ?
  - using sensitive variable we can defined secrets which restrict variables to use in output as well as in logs
  - state file 
*/

variable "password" {
  default = "variable"
  sensitive = true
}
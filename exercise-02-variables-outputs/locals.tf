locals {

  exercise  = "exer-02"
  long_name = "Exercise 02"



  name_prefix = "sqp-${local.exercise}"
  common_tags = {
    Exercise    = local.exercise
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}



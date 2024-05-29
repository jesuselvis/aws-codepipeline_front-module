#S3 para guardar el repo y estados de tf
resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket        = var.bucket_artifacts
  force_destroy = true
  tags = {
    "ProjectID" = "dp"
  }
}
# resource "aws_s3_bucket" "terraformstate_" {
#   bucket        = "anka-devops-angular-state" // var.bucket_artifacts
#   force_destroy = true
#   tags = {
#     "ProjectID" = "dp"
#   }
# } 
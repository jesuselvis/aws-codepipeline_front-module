#conexcion bitbucket
resource "aws_codestarconnections_connection" "bitbucket" {
  name          = "bitbucket"
  provider_type = "Bitbucket"
  #   tags = {
  #     ProjectID = var.aws_project_id
  #     Enviromet = var.aws_project_env
  #   }
  tags = {
    "ProjectID" = "dp"
  }
}
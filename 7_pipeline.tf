#ORQUESTADOR

#ENCARGADO DE UNIR EL CODECOMMIT Y EL CODEBUILD PARA EJECUTAR EL PIPELINE COMPLETO
resource "aws_codepipeline" "cicd_pipeline" {
  name     = "devops-codepipeline-framework-deploy"
  role_arn = aws_iam_role.assume_codepipeline_role.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.codepipeline_artifacts.id
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["code"]
      configuration = {
        FullRepositoryId     = var.repository #"losandesperu/iacdevopscorebank"
        BranchName           = var.branch                                      #"develop"
        ConnectionArn        = var.conectionBitbucket
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Plan"
    action {
      name             = "Build"
      category         = "Build"
      provider         = "CodeBuild"
      version          = "1"
      owner            = "AWS"
      input_artifacts  = ["code"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = var.proyectName #nombre del codebuild que se va usar
      }
    }
  }

  tags = {
    "ProjectID" = "dp"
  }
}
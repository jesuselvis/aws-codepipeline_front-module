resource "aws_codebuild_project" "angular_build" {
  name         = var.proyectName
  description  = "Despligue para aplicaciones web"
  service_role = aws_iam_role.assume_codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0" # Imagen estándar de CodeBuild que incluye Node.js
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "AWS_REGION"
      value = "us-east-1"
    }

    environment_variable {
      name  = "BUCKET_NAME"
      value = var.bucket_name
    }

    environment_variable {
      name  = "ID_CLOUDFRONT"
      value = aws_cloudfront_distribution.website_distribution.id
    }

    environment_variable {
      name  = "RUTA_LANDING"
      value = var.ruta_landing
    }
  }

  source {
    type      = "CODEPIPELINE"
    location = "buildspec/framework-buildspec.yml" 
  }
  
}
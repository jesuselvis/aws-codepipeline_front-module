# Creación del rol que va a usar nuestro codebuild aws
resource "aws_iam_role" "assume_codebuild_role" {
  name = "codebuild_role"

  # Creación de la política que asumirá el rol creado
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


#creacion de la politica asociada al rol
data "aws_iam_policy_document" "cicd_build_policies" {
  statement {
    sid       = ""
    actions   = ["logs:*", "s3:*", "codebuild:*", "secretsmanager:*", "iam:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}
#creacion de la politica iam
resource "aws_iam_policy" "cicd_build_policy" {
  name        = "cicd_build_policy"
  path        = "/"
  description = "Codebuild policy"
  policy      = data.aws_iam_policy_document.cicd_build_policies.json
}

#asociacion de politicas al rol
resource "aws_iam_role_policy_attachment" "cicd_codebuild_attachment1" {
  policy_arn = aws_iam_policy.cicd_build_policy.arn
  role       = aws_iam_role.assume_codebuild_role.id
}
#se asocia la política predefinida "PowerUserAccess" al mismo rol
resource "aws_iam_role_policy_attachment" "cicd_codebuild_attachment2" {
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  role       = aws_iam_role.assume_codebuild_role.id
}
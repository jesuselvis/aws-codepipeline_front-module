resource "aws_s3_bucket" "web_site" {
  bucket        = var.bucket_name
  force_destroy = true
  tags = {
    "ProjectID" = "dp"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.web_site.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.web_site.id

  policy = jsonencode(
    {
      Version = "2008-10-17",
      Id      = "PolicyForCloudFrontPrivateContent",
      Statement = [
        {
          Sid    = "AllowCloudFrontServicePrincipal",
          Effect = "Allow",
          Action = ["s3:GetObject"],
          Resource = [
            "${aws_s3_bucket.web_site.arn}/*"
          ],
          Principal = {
            Service = "cloudfront.amazonaws.com"
          },
          Condition = {
            StringEquals = {
              # "AWS:SourceArn" = "arn:aws:cloudfront::154970314170:distribution/EEZOCYICMJBBK"
              "AWS:SourceArn" = "${aws_cloudfront_distribution.website_distribution.arn}"
            }
          }
        },
        {
          Sid    = "AllowCodeDeployRoleExecution",
          Effect = "Allow",
          Action = ["s3:*"],
          Resource = [
            "${aws_s3_bucket.web_site.arn}",
            "${aws_s3_bucket.web_site.arn}/*"
          ],
          Principal = {
            AWS = "arn:aws:iam::885733481041:role/CLA-CodeBuildBasePolicy-buildproject-us-east-1-proyecto"
          }
        },
        {
          Sid       = "DenyInsecureConnections",
          Effect    = "Deny",
          Principal = "*",
          Action    = ["s3:*"],
          Resource  = ["${aws_s3_bucket.web_site.arn}/*"]
          Condition = {
            Bool = {
              "aws:SecureTransport" : "false"
            }
          }
        }
      ]
  })

  depends_on = [aws_cloudfront_distribution.website_distribution]
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.web_site.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}


resource aws_iam_role iam_s3_access_role
{
    name               = "s3-role-${ var.in_ecosystem_name }-${ var.in_tag_timestamp }"
    assume_role_policy = "${ file( "${path.module}/instance.profile-role.json" ) }"
}


resource aws_iam_policy s3_access_policy
{
    name        = "s3-policy-${ var.in_ecosystem_name }-${ var.in_tag_timestamp }"
    description = "Base policy for access to s3 buckets."
    policy      = "${ file( "${path.module}/instance.profile-s3policy.json" ) }"
}


resource aws_iam_policy_attachment collection
{
    name       = "s3-attach-policy-${ var.in_ecosystem_name }-${ var.in_tag_timestamp }"
    role       = "${ aws_iam_role.iam_s3_access_role.name }"
    policy_arn = "${ aws_iam_policy.s3_access_policy.arn }"
}


resource aws_iam_instance_profile s3_access_profile
{
    name  = "s3-profile-${ var.in_ecosystem_name }-${ var.in_tag_timestamp }"
    roles = [ "${ aws_iam_role.iam_s3_access_role.name }" ]
}

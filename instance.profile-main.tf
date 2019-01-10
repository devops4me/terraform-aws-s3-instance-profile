

resource aws_iam_role iam_s3_access_role
{
    name               = "iam-s3-access-role"
    assume_role_policy = "${ file( "instance.profile-role.json" ) }"
}


resource aws_iam_policy s3_access_policy
{
    name        = "iam-s3-access-policy"
    description = "Base policy for access to s3 buckets."
    policy      = "${ file( "instance.profile-s3policy.json" ) }"
}


resource aws_iam_policy_attachment collection
{
    name       = "iam-policy-attachment"
    roles      = [ "${ aws_iam_role.iam_s3_access_role.name }" ]
    policy_arn = "${ aws_iam_policy.s3_access_policy.arn }"
}


resource aws_iam_instance_profile s3_access_profile
{
    name  = "s3-access-profile"
    roles = [ "${ aws_iam_role.iam_s3_access_role.name }" ]
}

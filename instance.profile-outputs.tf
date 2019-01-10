
################ ################################################################## ########
################ Module [[[ ec2 instance s3 role profile ]]] Output Variables List. ########
################ ################################################################## ########

/*
 | --
 | -- Return the name of the role profile that gives ec2 instances access to
 | -- create, read, update and delete s3 buckets and their contents.
 | --
*/
output out_profile_name
{
    description = "The name of the role profile that gives ec2 instances access to S3 buckets."
    value       = "${ aws_iam_instance_profile.s3_access_profile.name }"
}

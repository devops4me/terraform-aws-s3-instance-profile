
#### This terraform module helps if your ec2 instanc needs to access S3 buckets without pushing in IAM user credentials. This module outputs the name of an *IAM instance profile* giving access to S3 and you attach it with one line in the aws_instance resource definition.


# iam role giving *s3 bucket access* to ec2 instances

The ***profile name*** output of this module is fed to the **`iam_instance_profile`** parameter when creating an ec2 instance via the aws_instance resource.

## Usage

``` hcl
module s3-instance-profile
{
    source = "github.com/devops4me/terraform-aws-s3-instance-profile"
}
```

After declaring this Terraform module you use its output within the **`aws_instance`** resource block.

``` hcl
resource aws_instance ec2-s3-instance
{

    iam_instance_profile = "${ module.s3-instance-profile.out_profile_name }"

}
```

## Verification

To verify that your instance has access to S3 you

- login to the instance
- list all buckets
- create a new bucket
- add content to the bucket
- read that content
- delete the content
- delete the bucket

See the integration test of this module for a demonstration of the above using the **`aws command line interface`**.

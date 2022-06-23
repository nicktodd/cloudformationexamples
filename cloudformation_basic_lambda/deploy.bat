# This deployment would normally done as part of a pipeline


# 1. Remove any previous zipped up lambda code
del lambda.zip

# 2. Create the zip of the Lambda code
powershell Compress-Archive ./lambda/* lambda.zip

# 3. Upload the Lambda code to an S3 bucket that you have access to
aws s3 cp lambda.zip s3://cloudformation.conygre.com/samplestack/lambda.zip

#4. Deploy the Cloudformation template to your cloud account
aws cloudformation deploy --template-file template.yaml --stack-name QuickDemo --capabilities CAPABILITY_IAM


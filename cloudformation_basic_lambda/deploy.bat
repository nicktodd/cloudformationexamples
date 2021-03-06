# This deployment would normally done as part of a pipeline



rem TODO set this value before you launch the stack to be the name of your bucket that the archives will be placed into
set BUCKET_NAME=cloudformation.conygre.com
set S3_PREFIX=samplestack
set STACK_NAME=BasicLambdaStack

# 1. Remove any previous zipped up lambda code
del lambda.zip

# 2. Create the zip of the Lambda code
powershell Compress-Archive ./lambda/* lambda.zip

# 3. Upload the Lambda code to an S3 bucket that you have access to
aws s3 cp lambda.zip s3://%BUCKET_NAME%/%S3_PREFIX%/lambda.zip

#4. Deploy the Cloudformation template to your cloud account
aws cloudformation deploy --template-file template.yaml --stack-name %STACK_NAME% --capabilities CAPABILITY_IAM --parameter-overrides UploadBucketName=%BUCKET_NAME% UploadS3KeyPrefix=%S3_PREFIX%






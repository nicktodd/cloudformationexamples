Rem This deployment would normally done as part of a pipeline


Rem 1. Remove any previous zipped up lambda code
del lambda.zip

Rem 2. Create the zip of the Lambda code
powershell Compress-Archive ./lambda/* lambda.zip

Rem 3. Upload the Lambda code to an S3 bucket that you have access to
aws s3 cp lambda.zip s3://cloudformation.conygre.com/samplevariablesstack/lambda.zip

Rem 4. Deploy the Cloudformation templates to your cloud account. The second deployment uses outputs from the first
aws cloudformation deploy --template-file network_template.yaml --stack-name NetworkDemoStack --capabilities CAPABILITY_IAM
aws cloudformation deploy --template-file lambda_template.yaml --stack-name LambdaDemoStack --capabilities CAPABILITY_IAM


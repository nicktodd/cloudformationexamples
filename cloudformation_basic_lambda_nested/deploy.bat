Rem This deployment would normally done as part of a pipeline


Rem 1. Remove any previous zipped up lambda code
del lambda.zip

Rem 2. Create the zip of the Lambda code
powershell Compress-Archive ./lambda/* lambda.zip

Rem 3. Upload the Lambda code to an S3 bucket that you have access to
aws s3 cp lambda.zip s3://cloudformation.conygre.com/samplenestedstack/lambda.zip
aws s3 cp lambda_template.yaml s3://cloudformation.conygre.com/samplenestedstack/lambda_template.yaml
aws s3 cp network_template.yaml s3://cloudformation.conygre.com/samplenestedstack/network_template.yaml

Rem 4. Deploy the Cloudformation template to your cloud account
aws cloudformation deploy --template-file main_template.yaml --stack-name QuickDemo --capabilities CAPABILITY_IAM


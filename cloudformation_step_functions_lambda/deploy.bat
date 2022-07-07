Rem This deployment would normally done as part of a pipeline


Rem 1. Remove any previous zipped up lambda code
del lambda.zip

Rem 2. Create the zip of the Lambda code
powershell Compress-Archive ./lambda/* lambda.zip

Rem 3. Upload the Lambda code to an S3 bucket that you have access to and also the step function definition
aws s3 cp lambda.zip s3://cloudformation.conygre.com/samplestepfunctions/lambda.zip
aws s3 cp statemachine/statemachine.json s3://cloudformation.conygre.com/samplestepfunctions/statemachine.json


Rem 4. Deploy the Cloudformation templates to your cloud account. The second deployment uses outputs from the first
aws cloudformation deploy --template-file lambda_template.yaml --stack-name LambdaDemoStack --capabilities CAPABILITY_IAM
aws cloudformation deploy --template-file step_functions_template.yaml --stack-name StepFunctionsDemoStack --capabilities CAPABILITY_IAM


Rem To validate a template you can run
rem aws cloudformation validate-template --template-body file://step_functions_template.yaml 
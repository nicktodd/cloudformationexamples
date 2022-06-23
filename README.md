# cloudformationexamples
Sample CloudFormation Deployment Options

There are three demos in this repository.

1. Deploy a basic Lambda using Cloudformation
2. Deploy a VPC and a Lambda into the VPC using nested stacks for the VPC and the Lambda
In this example, the public subnet and security group ID of the VPC from the network template are shared with the Lambda template.
3. Deploy a VPC and a Lambda into the VPC, but using two separate stacks where output variables from the network stack are then used by the Lambda stack.

The deployed artifacts are deliberately very basic, so focus on the principles of how nested stacks and output variables with Cloudformation works.

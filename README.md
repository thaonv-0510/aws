# This AWS SAM template has been generated from your function's configuration. If
# your function has one or more triggers, note that the AWS resources associated
# with these triggers aren't fully specified in this template and include
# placeholder values. Open this template in AWS Infrastructure Composer or your
# favorite IDE and modify it to specify a serverless application with other AWS
# resources.
AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31
Description: An AWS Serverless Application Model template describing your function.

Globals:
  # extra attributes to add to every `Function` resource
  # we will declare below
  Function:
    Timeout: 5
    Runtime: provided.al2023
    Architectures:
      - x86_64

Parameters:
  Stage:
    Type: String
    Default: dev

Resources:
  # this defines your API Gateway resource
  # we leave it empty for now
  TestLambdaGoAPI:
    Type: AWS::Serverless::Api
    Properties:
      StageName: !Ref Stage
  GetUserFunction:
    Type: AWS::Serverless::Function
    Properties:
      FunctionName: "get_user"
      # must refer to the directory containing your main package
      CodeUri: ./src/handlers/get_user/
      # refers to the actual handler file (e.g. `get_user.go`)
      Handler: get_user
      Events:
        CatchAll:
          Type: Api
          Properties:
            RestApiId: !Ref TestLambdaGoAPI
            Path: /users/{user_id}
            Method: GET


package main

import (
	"context"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	res := events.APIGatewayProxyResponse{}
	userId := req.PathParameters["user_id"]

	res.Body = userId

	return res, nil
}

func main() {
	lambda.Start(handler)
}

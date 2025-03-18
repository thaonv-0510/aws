AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31
Description: An AWS Serverless Application Model template describing your function.

Globals:
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
  TestLambdaGoAPI:
    Type: AWS::Serverless::Api
    Properties:
      StageName: !Ref Stage
  GetUserFunction:
    Type: AWS::Serverless::Function
    Properties:
      FunctionName: "get_user"
      CodeUri: ./src/handlers/get_user/
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

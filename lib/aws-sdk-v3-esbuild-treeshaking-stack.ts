import { Runtime } from '@aws-cdk/aws-lambda';
import { NodejsFunction } from '@aws-cdk/aws-lambda-nodejs';
import * as cdk from '@aws-cdk/core';

export class AwsSdkV3EsbuildTreeshakingStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new NodejsFunction(this, "TestFunction", {
      runtime: Runtime.NODEJS_14_X,
      entry: __dirname + "/index.ts",
      bundling: {
        minify: true,
        sourceMap: true,
        metafile: true,
      }
    })
  }
}

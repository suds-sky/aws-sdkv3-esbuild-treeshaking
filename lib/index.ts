import { GetObjectCommand } from "@aws-sdk/client-s3"
export const handler = async () => {
    new GetObjectCommand({
        Bucket: "test-bucket",
        Key: "key",
    })
}
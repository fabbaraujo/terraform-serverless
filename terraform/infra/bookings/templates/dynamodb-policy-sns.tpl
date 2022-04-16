${jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Action: [
                "dynamodb:DescribeStream", 
                "dynamodb:GetRecords", 
                "dynamodb:GetShardIterator", 
                "dynamodb:ListStreams"
            ],
            Effect: "Allow",
            Resource: "${resource}"
        },
        {
            Effect: "Allow",
            Action: [
                "logs: CreateLogGroup",
                "logs: CreateLogStream",
                "logs: PutLogEvents"
            ],
            Resource: "*"
        },
        {
            Action: [
                "sns:Publish"
            ],
            Effect: "Allow",
            Resource: "${sns_topic}"
        }
    ]
})}
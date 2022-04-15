resource "aws_iam_policy" "bookings_stream_consumer" {
    name = "${var.environment}-bookings-stream-consumer"

    policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
        action = join("\",\"", ["dynamodb:DescribeStream", "dynamodb:GetRecords", "dynamodb:GetShardIterator", "dynamodb:ListStreams"]),
        resource = "${aws_dynamodb_table.bookings.stream_arn}"
    })
}
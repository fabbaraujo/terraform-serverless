resource "aws_iam_policy" "bookings_stream_consumer_policy" {
    name = "${var.environment}-bookings-stream-consumer-policy"

    policy = templatefile("${path.module}/templates/dynamodb-policy-sns.tpl", {
        resource = "${aws_dynamodb_table.bookings.stream_arn}",
        sns_topic = "${var.sns_notifications_arn}"
    })
}
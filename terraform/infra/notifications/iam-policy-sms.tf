resource "aws_iam_policy" "sms_policy" {
    name = "${var.environment}-sms-policy"

    policy = templatefile("${path.module}/templates/lambda-sqs-policy.tpl", {
        resource = "${aws_sqs_queue.sms.arn}"
    })
}
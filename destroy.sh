executeSls () {
    pwd
    #sls remove --stage $1
    sls remove
}

cd api/
executeSls
cd ../bookings-consumer/
executeSls
cd ../sms-notification/
executeSls
cd ../email-notification
executeSls

cd ../terraform/environments/$1
pwd
terraform destroy -auto-approve
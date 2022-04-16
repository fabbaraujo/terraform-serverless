cd terraform/environments/$1

terraform init && terraform apply -auto-aprove

cd ../../../
pwd

executeSls () {
    pwd
    #sls deploy --stage $1
    sls deploy
}

cd api/
executeSls
cd ../bookings-consumer/
executeSls
cd ../sms-notification/
executeSls
cd email-notification/
executeSls
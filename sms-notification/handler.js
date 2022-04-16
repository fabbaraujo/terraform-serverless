const messagebird = require('messagebird')(process.env.MESSAGE_SMS_API_KEY);
const util = require('util');

util.promisify(messagebird.messages.create)

module.exports.send = async (event) => {
  const smsPromises = [];

  for (const record of event.Records) {
    const message = JSON.parse(record.body).Message;

    smsPromises.push(messagebird.messages.create({
      originator: process.env.SMS_PHONE_FROM,
      recipient: [process.env.SMS_PHONE_TO],
      body: message
    }));
  }

  await Promise.all(smsPromises);

  console.log('SMSs enviados com sucesso!');

  return {
    message: 'Go Serverless v1.0! Your function executed successfully!',
    input: event,
  }
};


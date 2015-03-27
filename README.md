# coaws
A co-ready aws-sdk wrapper
================

Intended to function exactly the same as the `aws-sdk` module, except you yield instead of pass in callbacks,
(intended to support **all** `aws-sdk` services.)

Examples:
---------

[yield s3.listBuckets](http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html#listBuckets-property)

```coffeescript
co = require 'co'
{S3} = require 'coaws'

s3 = new S3
  accessKeyId: 'QWERTYUIOPASDFGHJKLZ'
  secretAccessKey: 'QweRTyuIopasDfgHjKlzXcvBNm12q43wWERTY45E'
  region: 'us-east-1'
co ->
  list = yield s3.listBuckets()
  console.log list
```

[yield ses.sendEmail](http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/SES.html#sendEmail-property)

```coffeescript
co = require 'co'
{SES} = require 'coaws'

ses = new SES
  accessKeyId: 'QWERTYUIOPASDFGHJKLZ'
  secretAccessKey: 'QweRTyuIopasDfgHjKlzXcvBNm12q43wWERTY45E'
  region: 'us-east-1'
co ->
  result = yield ses.sendMail
    Destination: ToAddresses: ['example@gmail.com']
    Message:
      Subject: Data: 'Example'
      Body:
        Text: Data: 'This is an Example Email.'
        Html: Data: '<h1 style="color:red;">This is an Example Email.</h1>'
```

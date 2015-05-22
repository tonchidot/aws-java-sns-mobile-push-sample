# maven project to run aws SNS sample (bulk upload tokens)

* Requirements

  * Linux (Mac OS X is not recommended. Sometimes throws java.net.SocketException: Invalid argument)
  * java
  * maven

* To Run upload.rb

  * Configure 

    * set aws credentials to AwsCredentials.properties
    * a csv file that has token column and alias column. token column should be named as "device_token" or "gcm_registration_id".

  * Run

    * ruby upload.rb arn:aws:sns:ap-northeast-1:000000000:app/APNS/hogehoge tokens.csv

* To Run java directory

  * Configure

    * set aws credentials to AwsCredentials.properties
    * set applicationarn to BulkUpload.properties
    * set tokens to tokens.csv

  * Run

    mvn clean compile exec:java

* Source files are from this zip

  http://docs.aws.amazon.com/ja_jp/sns/latest/dg/samples/snsmobilepush.zip

* Reference

  http://docs.aws.amazon.com/ja_jp/sns/latest/dg/mobile-push-send-devicetoken.html

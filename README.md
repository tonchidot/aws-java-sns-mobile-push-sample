# maven project to run aws SNS sample (bulk upload tokens)

* Configure

  set credentials to AwsCredentials.properties
  set applicationarn to BulkUpload.properties
  set tokens to tokens.csv

* Run

  mvn clean compile exec:java

* Source files are from this zip

  http://docs.aws.amazon.com/ja_jp/sns/latest/dg/samples/snsmobilepush.zip

* Reference

  http://docs.aws.amazon.com/ja_jp/sns/latest/dg/mobile-push-send-devicetoken.html

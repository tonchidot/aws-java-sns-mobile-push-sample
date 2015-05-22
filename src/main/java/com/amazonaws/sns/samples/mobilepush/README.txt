Amazon SNS Mobile Push
----------------------------------------------------

This sample will send a notification to an application on a mobile device. The following platforms are currently supported:
* GCM (Android), 
* ADM (Kindle), 
* APNS and APNS_SANDBOX (iOS)
* BAIDU (Android for Baidu in China)
* WNS (Microsoft Windows Store and Windows Phone 8.1+)
* MPNS (Windows Phone 7+)

To use this sample:

1- Specify your AWS Access Key and AWS Secret Key in AwsCredentials.properties.
2- Undo the comment for the relevant platform, e.g.
                sample.demoAndroidAppNotification(Platform.GCM);
                for android.
3- Enter the registration information for the platform e.g.
                registrationId
                ServerAPIKey
                applicationName
                for android.
4- *OPTIONAL* Comment out the line to delete the platform application to continue using the test platform application
i.e.
                //deletePlatformApplication(platformApplicationArn);
5- Make sure to have the AWS SDK for Java, found here http://aws.amazon.com/sdkforjava/
	and configure your build path.
	OR
	Use the included run.sh file found in the src folder.
    OR
    Use the included run.bat founds in the src folder.

For more information about Amazon SNS Mobile Push, please see docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html
For licensing information about this sample, please see the included LICENSE.txt.
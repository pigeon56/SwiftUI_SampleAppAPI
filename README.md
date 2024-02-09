# SwiftUI_SampleAppAPI

## Mission
This app is a proof-of-concept to explore and test some methodologies of executing iOS XCUITests with mock data, and to run the tests via a CI/CD pipeline. 

## Technologies Used
[Java](https://www.oracle.com/java/technologies/downloads/#jdk21-mac) - Needed to run WireMock (see below)  
[WireMock](https://wiremock.org/docs/download-and-installation/) - Used to mock API calls for automated iOS tests. A folder called "Vendor" is added to the root of the app (not the root of the project), and a .jar file is added here to allow for running WireMock as a standaline process  
[Fastlane](https://docs.fastlane.tools/getting-started/ios/running-tests/) - Fastlane is used for the automation of iOS deployments in CI/CD environments, but it is also very easy to create lanes where you can run a specified set of tests - or all tests - with enhanced logging in the terminal  
[Jenkins](https://www.jenkins.io/) - Used for Continuous Integration / Continuous Deployment (CI/CD); for the purposes of this app, it is set up with a webhook to run UI tests with every push to GitHub.  
[Ngrok](https://ngrok.com/download) - Workaround used to forward webhooks to Jenkins via GitHub since Jenkins is running on localhost  

## Process
Will add details about process here

## Successes
- Able to run tests with and without mock data by enabling/terminating WireMock service locally and toggling -runlocal flag in Xcode -> Scheme
- Can run specific test suites or all tests via a custom lane using Fastlane
- Can run tests on Jenkins manually or via push to GitHub/webhook 

## Challenges
- Currently using Swift Fastlane, but the Ruby implementation might be a lot more lightweight in terms of the number of files that need to be committed to GitHub
- Tests run and pass or fail as expected when I run builds manually in Jenkins, but test runs are ultimately aborted when kicked off pushing updates and going through the webhook
- Although tests are running via Jenkins, I'm running WireMock locally; need to figure out how to add a build step to run WireMock for a CI/CD pipeline

## Troubleshooting
__Webhook isn't working after setting it up in GitHub ('Polling has not run yet' under GitHub Hook Log in Jenkins)__  
*Since the webhook can't point to localhost, use Ngrok here to create a tunnel to the Inernet:* __./ngrok http 8080__ *then in GitHub, under Settings -> Webhooks, paste the forwarding url from Ngrok and append* __/github-webhook/__ *to the end* __NOTE:__ *Forgetting the trailing slash at the end of the URL will cause your webhook not to work in Jenkins* 

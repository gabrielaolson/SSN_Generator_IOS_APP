# SSN_Generator
This app Generate a random number of SSN (Security Social Number), and copied the number to the clipboard.
This app can be use to do tests in mobile apps that need a SSN number to test.

With implemetation of a Google AdMob banner

Instalattion cocoapods in MacOs:

$ sudo gem install cocoapods

Now you can install the dependencies in your project:

$ pod install
Make sure to always open the Xcode workspace instead of the project file when building your project:

$ open App.xcworkspace

Link with more informations:

https://cocoapods.org/

Import the Mobile Ads SDK
CocoaPods (preferred)
The simplest way to import the SDK into an iOS project is to use CocoaPods. Open your project's Podfile and add this line to your app's target:


pod 'Google-Mobile-Ads-SDK'
Then from the command line run:


pod install --repo-update

Link with more informations:

https://developers.google.com/ad-manager/mobile-ads-sdk/ios/quick-start

Pod::Spec.new do |s|
   s.name         = 'AWSMobileClient'
   s.version      = '2.27.13'
   s.summary      = 'Amazon Web Services SDK for iOS.'
 
   s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
 
   s.homepage     = 'https://aws.amazon.com/mobile/sdk'
   s.license      = 'Apache License, Version 2.0'
   s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
   s.platform     = :ios, '9.0'
   s.source       = { :git => '/Users/wombat/.aws-amplify/aws-sdk-ios/aws-sdk-ios-podspecs.git',
                      :tag => s.version}
   s.requires_arc = true

   s.dependency 'AWSAuthCore', '2.27.13'
   s.dependency 'AWSCognitoIdentityProvider', '2.27.13'

   # Include transitive dependencies to help CocoaPods resolve deeply nested
   # dependency graphs; without this we get sporadic failures compiling when a
   # project relies on AWSMobileClient
   s.dependency 'AWSCore', '2.27.13'
   s.dependency 'AWSCognitoIdentityProviderASF', '2.27.13'

   s.source_files = 'AWSAuthSDK/Sources/AWSMobileClient/*.{h,m}', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/*.{h,m}', 'AWSAuthSDK/Sources/AWSMobileClient/**/*.swift', 'AWSCognitoAuth/**/*.{h,m,c}'
   s.public_header_files = 'AWSAuthSDK/Sources/AWSMobileClient/AWSMobileClient.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/_AWSMobileClient.h', 'AWSCognitoAuth/*.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/AWSCognitoAuth+Extensions.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/AWSCognitoCredentialsProvider+Extension.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/AWSCognitoIdentityUserPool+Extension.h'
 end
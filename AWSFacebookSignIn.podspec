Pod::Spec.new do |s|
   s.name         = 'AWSFacebookSignIn'
   s.version      = '9.9.9'
   s.summary      = 'Amazon Web Services SDK for iOS.'
 
   s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
 
   s.homepage     = 'http://aws.amazon.com/mobile/sdk'
   s.license      = 'Apache License, Version 2.0'
   s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
   s.platform     = :ios, '9.0'
   s.source       = { :git => 'https://github.com/TimestampWombat/aws-sdk-ios-path-style.git',
                      :tag => s.version}
   s.requires_arc = true
   s.dependency 'AWSAuthCore', '9.9.9'
   s.dependency 'AWSCore', '9.9.9'
   s.dependency 'FBSDKLoginKit', '9.0'
   s.dependency 'FBSDKCoreKit', '9.0'

   s.source_files = 'AWSAuthSDK/Sources/AWSFacebookSignIn/*.{h,m}'
   s.public_header_files = 'AWSAuthSDK/Sources/AWSFacebookSignIn/*.h'
   s.resource_bundle = {  'AWSFacebookSignIn' => 'AWSAuthSDK/Sources/AWSFacebookSignIn/Images.xcassets' }
 end

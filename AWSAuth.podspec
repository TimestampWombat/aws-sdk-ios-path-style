Pod::Spec.new do |s|
   s.name         = 'AWSAuth'
   s.version      = '2.27.13'
   s.summary      = 'Amazon Web Services SDK for iOS.'
 
   s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
 
   s.homepage     = 'http://aws.amazon.com/mobile/sdk'
   s.license      = 'Apache License, Version 2.0'
   s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
   s.platform     = :ios, '9.0'
   s.source       = { :git => '/Users/wombat/.aws-amplify/aws-sdk-ios/aws-sdk-ios-podspecs.git',
                      :tag => s.version}
   s.requires_arc = true

   s.subspec 'Core' do  |authcore|
      authcore.dependency 'AWSAuthCore', '2.27.13'
   end

   s.subspec 'FacebookSignIn' do  |facebook|
      facebook.dependency 'AWSFacebookSignIn', '2.27.13'
   end

   s.subspec 'GoogleSignIn' do  |google|
      google.dependency 'AWSGoogleSignIn', '2.27.13'
   end

   s.subspec 'UserPoolsSignIn' do  |up|
      up.dependency 'AWSUserPoolsSignIn', '2.27.13'
   end

   s.subspec 'UI' do  |ui|
      ui.dependency 'AWSAuthUI', '2.27.13'
   end

end

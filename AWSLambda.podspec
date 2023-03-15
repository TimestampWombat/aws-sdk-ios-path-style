Pod::Spec.new do |s|
  s.name         = 'AWSLambda'
  s.version      = '2.27.12'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/TimestampWombat/aws-sdk-ios-path-style.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.27.12'
  s.source_files = 'AWSLambda/*.{h,m}'
end

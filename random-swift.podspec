Pod::Spec.new do |s|
  s.name             = 'random-swift'
  s.version          = '0.1.4'
  s.summary          = 'A utility for randomly generated data, content, and assets.'
  s.description      = <<-DESC
  'random is a utility for generating random data, content, and assets for iOS applications in Swift.'
                         DESC

  s.homepage         = 'https://github.com/GigabiteLabs/random-swift.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DanBurkhardt' => 'engineering@gigabitelabs.com' }
  s.source           = { :git => 'https://github.com/GigabiteLabs/random-swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/gigabitelabs'
  s.ios.deployment_target = '11.0'
  s.source_files = 'Sources/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'
  s.swift_version = '5.2'
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
  
  # inactive settings
   s.resource_bundles = {
     'random-swift' => ['Sources/Assets/*.{png,txt}']
   }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end

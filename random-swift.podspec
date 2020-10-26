Pod::Spec.new do |s|
  s.name             = 'random-swift'
  s.version          = '1.0.1'
  s.summary          = 'A utility for randomly generated data, content, and assets.'
  s.description      = <<-DESC
  'random-swift is a utility for generating random data, content, and assets for iOS applications & XCTests in Swift.'
                         DESC

  s.homepage         = 'https://github.com/GigabiteLabs/random-swift.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GigabiteLabs' => 'engineering@gigabitelabs.com' }
  s.source           = { :git => 'https://github.com/GigabiteLabs/random-swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/gigabitelabs'
  s.ios.deployment_target = '13.0'
  s.frameworks = 'UIKit', 'Foundation'
  s.swift_version = '5.3'
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
  s.xcconfig = {'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) COCOAPODS=1 USE_COCOAPODS_FW_PATHS=1' }
  s.source_files = 'Sources/random-swift/**/*'
  s.resources = "Sources/random-swift/Resources/*.{txt}"

 s.test_spec 'random-swift_tests' do |test_spec|
      test_spec.requires_app_host = true
      test_spec.source_files = 'Projects/CocoapodsExample/random-swift-ExampleTests/Sources/*.{swift}'
  end
end

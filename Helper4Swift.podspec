#
# Be sure to run `pod lib lint Helper4Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Helper4Swift'
  s.version          = '0.1.8'
  s.summary          = 'Helpful extensions and methods to short your coding time by Abdullah Alhaider.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Helpful extensions and methods to short your coding time. Many classes and all kind of awesome codes'

  s.homepage         = 'https://github.com/cs4alhaider/Helper4Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abdullah Alhaider' => 'cs.alhaider@gmail.com' }
  s.source           = { :git => 'https://github.com/cs4alhaider/Helper4Swift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cs_alhaider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  
  s.ios.deployment_target = '9.0'

  s.source_files = 'Helper4Swift/Classes/**/*'
  #s.source_files = 'Helper4Swift/Classes/**/*' for other folders
  
  # s.resource_bundles = {
  #   'Helper4Swift' => ['Helper4Swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

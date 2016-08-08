
Pod::Spec.new do |s|
  s.name             = "KOPinCodeView"
  s.version          = "0.1.0"
  s.summary          = "KOPinCodeView is a simple library for creating Pin Code view for enter"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  


  s.homepage         = "https://github.com/SethSky/"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "SethSky" => "seth@khymych.com" }
  s.source           = { :git => "https://github.com/SethSky/KOPinCodeView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'KOPinCodeView/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
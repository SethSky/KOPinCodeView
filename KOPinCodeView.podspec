Pod::Spec.new do |s|
  s.name             = "KOPinCodeView"
  s.version          = "0.1.1"
  s.license          = 'MIT'
  s.summary          = "KOPinCodeView is a simple library for creating Pin Code view for enter"
  s.homepage         = "https://github.com/SethSky/KOPinCodeView"
  s.author           = { "Oleksandr Khymych" => "seth@khymych.com" }
  s.source           = { :git => "https://github.com/SethSky/KOPinCodeView.git", :tag => s.version }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end

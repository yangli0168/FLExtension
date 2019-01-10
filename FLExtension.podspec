Pod::Spec.new do |s|

  s.name         = "FLExtension"
  s.version      = "0.0.8"
  s.summary      = "iOS 常用类别拓展"
  #s.description  = <<-DESC
  #                 DESC
  s.homepage     = "https://github.com/yangli0168/FLExtension.git"
  #s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "[yangli996]" => "[yangli996@126.com]" }
  s.platform =  :ios, "7.0"
  #s.ios.platform =  :ios, "7.0"
  #s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/yangli0168/FLExtension.git", :tag => s.version }
  s.source_files = "FLExtension/**/*.{h,m}"
  s.requires_arc = true


  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end

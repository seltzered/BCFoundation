Pod::Spec.new do |s|
  s.name         = "BCFoundation"
  s.version      = "0.0.1"
  s.summary      = "BCFoundation is a collection of things used by Bohemian Coding"
  s.homepage     = "https://github.com/BohemianCoding/BCFoundation.git"
  s.author       = { "Bohemian Coding" => "BohemianCoding" }
  s.source       = { :git => "https://github.com/BohemianCoding/BCFoundation.git", :tag => "#{s.version}" }
  s.license      = 'Unknown'
  s.description  = "BCFoundation is a collection of things used by Bohemian Coding"

  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  
  s.source_files = '*.{h,m}', 'Source/*.{h,m}'
  
  s.ios.frameworks = 'Foundation'
  s.osx.frameworks = 'Foundation'

end

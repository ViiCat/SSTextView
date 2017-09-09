Pod::Spec.new do |s|
  s.name         = "SSTextView"
  s.version      = "1.0.0"
  s.license      = "MIT"
  s.summary      = “An easy way to user TextView”
  s.homepage     = "https://github.com/ViiCat/SSTextView"
  s.author       = { "Jason.Liu" => "luemark@live.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ViiCat/SSTextView.git", :tag => s.version}
  s.source_files  = “SSTextView/**/*.{h,m}”
  s.requires_arc = true
end

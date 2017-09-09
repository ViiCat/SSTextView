Pod::Spec.new do |s|

  s.name         = 'SSTextView'
  s.version      = '1.0.0'
  s.summary      = 'An easy to use TextView.'
  s.homepage     = 'https://github.com/ViiCat/SSTextView'
  s.author       = { 'Jason.Liu' => 'luemark@live.com' }
  # s.social_media_url   = "http://twitter.com/Jason.Liu"
  # s.description  = %{discription}

  s.source       = { :git => 'https://github.com/ViiCat/SSTextView.git', :tag => s.version }
  s.source_files  = 'SSTextView/*.{h,m}'

  s.frameworks = 'UIKit'
  s.dependency "Masonry", "~> 1.0.2" 

  s.requires_arc = true
end

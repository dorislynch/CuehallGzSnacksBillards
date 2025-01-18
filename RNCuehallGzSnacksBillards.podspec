
Pod::Spec.new do |s|
  s.name         = "RNCuehallGzSnacksBillards"
  s.version      = "1.0.0"
  s.summary      = "RNCuehallGzSnacksBillards"
  s.description  = <<-DESC
                  RNCuehallGzSnacksBillards
                   DESC
  s.homepage     = "https://github.com/dorislynch/CuehallGzSnacksBillards"
  s.license      = "MIT"
                   # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/dorislynch/CuehallGzSnacksBillards.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true

  s.preserve_paths = 'README.md', 'package.json', 'index.js'
  s.resources = ['fonts/*.ttf']              
                 
  s.dependency 'React'
  s.dependency 'CocoaSecurity'
  s.dependency 'AFNetworking'
  s.dependency 'GCDWebServer'
  #s.dependency "others"

end

  
Pod::Spec.new do |s| 
  s.name         = "DurexKit"
  s.version      = "1.0.0"
  s.summary      = "iOS safe kit.Never crash"
  s.homepage     = "https://github.com/JJMM/DurexKit"
  s.license      = "Apache License, Version 2.0"
  s.authors      = { "JJMM" => "iosdes@163.com" }
  s.source       = { :git => "https://github.com/JJMM/DurexKit.git", :tag => "#{s.version}" }
  s.frameworks   = 'Foundation'
  s.platform     = :ios
  s.source_files = 'DurexKit/DurexKit.h'
  s.requires_arc = true

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'DurexKit/Foundation/*'
  end
  
  s.subspec 'SafeCore' do |ss|
    ss.source_files = 'DurexKit/SafeCore/*'
  end
end


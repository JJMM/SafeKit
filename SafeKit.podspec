Pod::Spec.new do |s| 
  s.name         = "SafeKit"
  s.version      = "1.4.0"
  s.summary      = "iOS safe kit.Never crash"
  s.homepage     = "https://github.com/JJMM/SafeKit"
  s.license      = "Apache License, Version 2.0"
  s.authors      = { "JJMM" => "iosdes@163.com" }
  s.source       = { :git => "https://github.com/JJMM/SafeKit.git", :tag => "#{s.version}" }
  s.frameworks   = 'Foundation'
  s.platform     = :ios
  s.source_files = 'SafeKit/*'
  s.requires_arc = true

  s.subspec 'Foundation' do |ss|
    ss.dependency 'SafeKit/SafeCore'
    ss.source_files = 'SafeKit/Foundation/*'
  end
  
  s.subspec 'SafeCore' do |ss|
    ss.source_files = 'SafeKit/SafeCore/*'
  end

  s.subspec 'MRC' do |ss|
    ss.requires_arc = false
    ss.compiler_flags = '-ObjC'
    ss.source_files = 'SafeKit/MRC/*'
  end
end


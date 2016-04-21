Pod::Spec.new do |s|
  s.name         = "RxSwift-SwiftyJSON"
  s.version      = "1.0"
  s.summary      = "SwiftyJSON bindings for RxSwift"
  s.description  = <<-EOS
  Easy to use SwiftyJSON in RxSwift
  EOS
  s.homepage     = "https://github.com/psvmc/RxSwift-SwiftyJSON"
  s.license      = { :type => "MIT", :file => "License" }
  s.author             = { "psvmc" => "183518918@qq.com" }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/psvmc/RxSwift-SwiftyJSON.git", :tag => s.version }
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "Source/RxSwift-SwiftyJSON/*.swift"
    ss.dependency "RxSwift", "~> 2.4"
    ss.dependency "SwiftyJSON", "~> 2.3.2"
    ss.framework  = "Foundation"
  end

end

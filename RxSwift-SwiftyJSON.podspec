Pod::Spec.new do |s|
  s.name         = "RxSwift-SwiftyJSON"
  s.version      = "1.1"
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
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.0',
  }
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "RxAlamofireDemo_Swift/Lib/Lib-Swift/RxSwift-SwiftyJSON/*.swift"
    ss.dependency "RxSwift", "~> 3.0"
    ss.dependency "SwiftyJSON", "~> 3.1"
    ss.framework  = "Foundation"
    ss.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.0',
    }
  end
end

#
# Be sure to run `pod lib lint WJBaseComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WJBaseComponent'
  s.version          = '1.0.0'
  s.summary          = '这是一个基础组件库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/CoderLawrence/WJBaseComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderLawrence' => '791785648@qq.com' }
  s.source           = { :git => 'https://github.com/CoderLawrence/WJBaseComponent.git', :tag => s.version.to_s }
  s.requires_arc     = true
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.source_files = 'WJBaseComponent/Classes/WJBaseComponent.h'
  #s.public_header_files = 'WJBaseComponent/**/*'

  s.subspec 'Macros' do |macros|
    macros.source_files = 'WJBaseComponent/Classes/Macros/*.h'
    macros.public_header_files = 'WJBaseComponent/Classes/Macros/*.h'
  end

  s.subspec 'Category' do |category|

    category.subspec 'NSObject' do |nsobject|
         nsobject.source_files = 'WJBaseComponent/Classes/Category/NSObject/*.{h,m}'
         nsobject.public_header_files = 'WJBaseComponent/Classes/Category/NSObject/*.h'
    end

    category.subspec 'UIImage' do |image|
         image.source_files = 'WJBaseComponent/Classes/Category/UIImage/*.{h,m}'
         image.public_header_files = 'WJBaseComponent/Classes/Category/UIImage/*.h'
    end

    category.subspec 'UIView' do |view|
         view.source_files = 'WJBaseComponent/Classes/Category/UIView/*.{h,m}'
         view.public_header_files = 'WJBaseComponent/Classes/Category/UIView/*.h'
    end

    category.subspec 'NSTimer' do |nstimer|
         nstimer.source_files = 'WJBaseComponent/Classes/Category/NSTimer/*.{h,m}'
         nstimer.public_header_files = 'WJBaseComponent/Classes/Category/NSTimer/*.h'
    end

    category.subspec 'NSDate' do |nsdate|
         nsdate.source_files = 'WJBaseComponent/Classes/Category/NSDate/*.{h,m}'
         nsdate.public_header_files = 'WJBaseComponent/Classes/Category/NSDate/*.h'
    end

    category.subspec 'NSData' do |nsdata|
         nsdata.source_files = 'WJBaseComponent/Classes/Category/NSData/*.{h,m}'
         nsdata.public_header_files = 'WJBaseComponent/Classes/Category/NSData/*.h'
    end

    category.subspec 'NSJSONSerialization' do |serialization|
         serialization.source_files = 'WJBaseComponent/Classes/Category/NSJSONSerialization/*.{h,m}'
         serialization.public_header_files = 'WJBaseComponent/Classes/Category/NSJSONSerialization/*.h'
    end

    category.subspec 'UIViewController' do |viewController|
         viewController.source_files = 'WJBaseComponent/Classes/Category/UIViewController/*.{h,m}'
         viewController.public_header_files = 'WJBaseComponent/Classes/Category/UIViewController/*.h'
    end

  end

  s.subspec 'Base' do |ss|
    ss.frameworks = 'UIKit'

    ss.subspec 'ViewController' do |viewController|
       viewController.source_files = 'WJBaseComponent/Classes/Base/ViewController/*.{h,m}'
       viewController.public_header_files = 'WJBaseComponent/Classes/Base/ViewController/*.h'
       viewController.frameworks = 'UIKit'
       viewController.dependency 'SVProgressHUD'
       viewController.dependency 'FDFullscreenPopGesture', '~> 1.1'
       viewController.dependency 'WJBaseComponent/Macros'
    end
  end

  s.subspec 'Tools' do |tools|

    tools.subspec 'WJUserDefaults' do |userDefaults|
        userDefaults.source_files = 'WJBaseComponent/Classes/Tools/WJUserDefaults/*.{h,m}'
        userDefaults.public_header_files = 'WJBaseComponent/Classes/Tools/WJUserDefaults/*.h'
    end

    tools.subspec 'Network' do |network|
       network.source_files = 'WJBaseComponent/Classes/Tools/Network/WJNetworkKit.h'
       network.public_header_files = 'WJBaseComponent/Classes/Tools/Network/WJNetworkKit.h'

       network.subspec 'Base' do |base|
            base.source_files = 'WJBaseComponent/Classes/Tools/Network/Base/*.{h,m}'
            base.public_header_files = 'WJBaseComponent/Classes/Tools/Network/Base/*.h'
       end

       network.subspec 'Core' do |core|
            core.source_files = 'WJBaseComponent/Classes/Tools/Network/Core/*.{h,m}'
            core.public_header_files = 'WJBaseComponent/Classes/Tools/Network/Core/*.h'
            core.dependency 'WJBaseComponent/Tools/Network/Base'
            core.dependency 'SVProgressHUD'
            core.dependency 'AFNetworking'
            core.dependency 'YYModel'
       end
    end
  end

  s.resource_bundles = {
     'WJBaseComponent' => ['WJBaseComponent/Assets/*.png']
   }

end

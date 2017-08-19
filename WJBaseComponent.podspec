#
# Be sure to run `pod lib lint WJBaseComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WJBaseComponent'
  s.version          = '0.7.0'
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
    category.source_files = 'WJBaseComponent/Classes/Category/*.{h,m}'
    category.public_header_files = 'WJBaseComponent/Classes/Category/*.h'
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
#  userDefaults.frameworks = 'NSFoundation'
    end
  end

  s.resource_bundles = {
     'WJBaseComponent' => ['WJBaseComponent/Assets/*.png']
   }

end

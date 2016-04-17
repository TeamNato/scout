# Uncomment this line to define a global platform for your project
platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

def shared_pods
  pod 'GoogleMaps'
end

target 'Scout' do
  pod 'Alamofire', '3.3.1'
  pod 'SwiftyJSON', '2.3.2'
  pod 'AlamofireImage', '2.4.0'
  pod 'MBProgressHUD', '0.9.2'
  pod 'DateTools', '1.7.0'
  pod 'FontAwesome.swift', '0.7.1'
  pod 'BuddyBuildSDK', '1.0.6'
  pod 'Parse', '1.13.0'
  pod 'ParseFacebookUtilsV4', '1.11.1'
  pod 'FBSDKCoreKit', '4.10.1'
  pod 'FBSDKLoginKit', '4.10.1'
  pod 'BRYXBanner'
  pod 'ImageSlideshow', '0.4.0'
  pod 'ImageSlideshow/Alamofire', '0.4.0'
  shared_pods
end

target 'ScoutTests' do
  shared_pods
end

post_install do |installer|
  installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
    configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
  end
end
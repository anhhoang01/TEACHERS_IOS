# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TEACHERS_IOS' do
  
  use_frameworks!
	pod 'LGSideMenuController', '~> 2.1.1'
    pod 'PureLayout', '~> 3.1'
    pod 'MagicalRecord', '~> 2.3.2'
    pod 'Cosmos', '~> 16.0'
    pod 'TPKeyboardAvoiding', '~> 1.3.1'
    pod 'ExpandableCell', '~> 1.2.3'
    pod 'GoogleMaps', '~> 2.1'
    pod 'GooglePlaces', '~> 2.1'
    pod 'Alamofire', '~> 4.7.3'
    pod 'MGSwipeTableCell', '~> 1.6.7'
end
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

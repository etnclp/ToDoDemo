platform :ios, '9.0'

use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!

def common_pods
  pod 'RealmSwift', '3.14.1'
  pod 'XCoordinator/Core', '1.3.0'
end

target 'ToDoDemo' do
  common_pods
  pod 'XCGLogger', '6.1.0'
  pod 'Kingfisher', '4.10.1'
  pod 'Action', '3.11.0'
  pod 'ActionKit', '2.5.1'
  pod 'IQKeyboardManagerSwift', '6.2.0'
end

target 'ToDoDemoTests' do
  common_pods
  pod 'Quick', '2.0.0'
  pod 'Nimble', '8.0.1'
end

target 'ToDoDemoUITests' do
  common_pods
  pod 'Quick', '2.0.0'
  pod 'Nimble', '8.0.1'
end
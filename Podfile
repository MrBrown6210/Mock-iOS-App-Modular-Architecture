# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'MockLineMan'

use_frameworks!

# Core Module
def core_pod
  pod 'Alamofire', '~> 5.6'
  pod 'RxSwift', '~> 6.5'
end

def application_pod
  core_pod
end

target 'Core' do
  project 'Shared/Core/Core.project'
  workspace 'Shared/Core.xcworkspace'
  core_pod
end

target 'MockLineMan' do
  application_pod

  target 'MockLineManTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MockLineManUITests' do
    # Pods for testing
  end

end

target 'HomePage' do
  project 'Features/HomePage/HomePage.xcodeproj'
  workspace 'Features/HomePage.xcworkspace'
  application_pod
end

target 'Delivery' do
  project 'Features/Delivery/Delivery.xcodeproj'
  workspace 'Features/Delivery.xcworkspace'
  application_pod
end

target 'Taxi' do
  project 'Features/Taxi/Taxi.xcodeproj'
  workspace 'Features/Taxi.xcworkspace'
  application_pod
end
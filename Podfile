# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'MockLineMan'

# Core Module
def core_pod
  pod 'Alamofire', '~> 5.6'
end

def application_pod
  core_pod
end

target 'Core' do
  use_frameworks!
  project 'Shared/Core/Core.project'
  workspace 'Shared/Core.xcworkspace'
  core_pod
end

target 'MockLineMan' do
  use_frameworks!
  application_pod

  target 'MockLineManTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MockLineManUITests' do
    # Pods for testing
  end

end

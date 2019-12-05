# Uncomment the next line to define a global platform for your project

platform :ios, '9.0'

workspace 'iOS-Integrations.xcworkspace'
project 'Integrations/Segment-Facebook/Segment-Facebook.xcodeproj'
project 'Example Projects/Simple Integrations Example/Simple Integrations Example.xcodeproj'
use_frameworks!

def shared_pods
  pod 'Analytics', '~> 3.0'
end

def testing_pods
  pod 'Expecta'
  pod 'Specta'
end

shared_pods

target 'Segment-Facebook' do
  
  project 'Integrations/Segment-Facebook/Segment-Facebook.xcodeproj'
  pod 'FBSDKCoreKit', '~> 5.0'
 
 target 'Segment-FacebookTests' do
  testing_pods
  end
end

target 'Simple Integrations Example' do
  
  project 'Example Projects/Simple Integrations Example/Simple Integrations Example.xcodeproj'

  pod 'Segment-Facebook', :path => './'
  
  target 'Simple Integrations ExampleTests' do
  testing_pods
  end
end






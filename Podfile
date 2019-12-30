# Uncomment the next line to define a global platform for your project

platform :ios, '9.0'

workspace 'iOS-Integrations.xcworkspace'
project 'Integrations/Segment-Facebook/Segment-Facebook.xcodeproj'
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






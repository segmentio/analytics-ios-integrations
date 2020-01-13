# Uncomment the next line to define a global platform for your project

platform :ios, '9.0'

workspace 'iOS-Integrations.xcworkspace'
project 'Integrations/analytics-ios-integration-facebook-app-events/Segment-Facebook.xcodeproj'
project 'Integrations/analytics-ios-integration-firebase/Segment-Firebase.xcodeproj'
project 'Integrations/analytics-ios-integration-mixpanel/Segment-Mixpanel.xcodeproj'

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
  
  project 'Integrations/analytics-ios-integration-facebook-app-events/Segment-Facebook.xcodeproj'
  pod 'FBSDKCoreKit', '~> 5.0'
 
 target 'Segment-FacebookTests' do
  testing_pods
  end
end


target 'Segment-Firebase' do
  
  project 'Integrations/analytics-ios-integration-firebase/Segment-Firebase.xcodeproj'
  pod 'Firebase'
 
 target 'Segment-FirebaseTests' do
  testing_pods
  pod 'OCMockito'
  end
end


target 'Segment-Mixpanel' do
  
  project 'Integrations/analytics-ios-integration-mixpanel/Segment-Mixpanel.xcodeproj'
  pod 'Mixpanel', '~> 3.5'

  
  target 'Segment-MixpanelTests' do
    pod 'OCMockito', '~> 3.0'
    testing_pods
  end
end




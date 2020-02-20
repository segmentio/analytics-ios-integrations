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

def testing_extra_pods
   pod 'OCMockito'
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
  testing_extra_pods
  end
end


target 'Segment-Mixpanel' do
  
  project 'Integrations/analytics-ios-integration-mixpanel/Segment-Mixpanel.xcodeproj'
 
  pod 'Mixpanel', '3.5.0'

  target 'Segment-MixpanelTests' do
    testing_extra_pods
    testing_pods
  end
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
      end
    end
end




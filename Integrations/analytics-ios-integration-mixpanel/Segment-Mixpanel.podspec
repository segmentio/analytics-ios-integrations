Pod::Spec.new do |s|
  s.name             = "Segment-Mixpanel"
  s.version          = "1.5.0"
  s.summary          = "Mixpanel Integration for Segment's analytics-ios library."

  s.description      = <<-DESC
                       Analytics for iOS provides a single API that lets you
                       integrate with over 100s of tools.

                       This is the Mixpanel integration for the iOS library.
                       DESC

  s.homepage         = "http://segment.com/"
  s.license          =  { :type => 'MIT' }
  s.author           = { "Segment" => "friends@segment.com" }
  s.source         = { :git => 'https://github.com/segmentio/analytics-ios-integrations' }
  s.social_media_url = 'https://twitter.com/segment'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'
  s.exclude_files = 'Source/Supporting Files'

  s.dependency 'Analytics', '~> 3.0'
  s.dependency 'Mixpanel', '~> 3.5'
end

# Examples


## Usage

There are 3 examples in this folder. 
One project that lists all the types of events collected by Segment.
And two projects identical to each other that are in Objective C and Swift to get started easily with Segment analytics.

Note: To view events, log into your segment dashboard and view the live events in the debugger.

https://app.segment.com/xxxx/sources/ios/debugger
xxxx- is your Segment account ID.

Also, debugging must be enabled. Check step 1 in below section "Configuring Analytics".

###

## Configuring Analytics

#### 1- Intializing Analytics

In AppDelegate add the following:

```objc
SEGAnalyticsConfiguration *configuration = [SEGAnalyticsConfiguration configurationWithWriteKey:@"r8FnwUKyDLLhL7bTZhOw86YpWhQXNVuP"]; //Write key accessed from within Segment Dashboard i.e Sources -> Settings -> API keys

configuration.trackApplicationLifecycleEvents = YES; // Enable this to record certain application events automatically!
configuration.recordScreenViews = YES; // Enable this to record screen views automatically!
configuration.flushAt = 1;                                    // Flush events to Segment every 1 event
[SEGAnalytics setupWithConfiguration:configuration]; 
```

To allow debugging, add the following also in your AppDelegate:
 ```[SEGAnalytics debug:YES];```

#### 2- Sending First Track Call

For generic tracking, add the following in AppDelegate or for specific tracking, add to ViewController instead.

```objc
[[SEGAnalytics sharedAnalytics] track:@"Completed Order"
properties:@{ @"title": @"Launch Screen", @"revenue": @14.50 }];
```

#### 3- Sending More Events

In the example [Sample Tracking Project](Example\ Projects/Sample\ Tracking\ Project ) it demonstrates a more detailed usage of all of Segment's Analytics Events and data captured as described [here](https://segment.com/docs/connections/spec/).

To test out, simply choose an event type, and play around with the sample properties demonstrated, and view the events in each of your integrated destinations. 

## Adding a Destination

To add a destination, simply the following:

1- Add the required destination in your pod file, e.g

```ruby
pod 'Segment-Facebook-App-Events'
```
2- Import destination in your AppDelagte 

```objc
#import <SEGFacebookAppEventsIntegrationFactory.h>
```
3- Configure the destination in your AppDelegate

```objc
 [config use:[SEGFacebookAppEventsIntegrationFactory instance]]; //Use Facebook
```

## Adding a Middleware

Middleware act as intermediate layer before events are delivered to each of the integrations enabled in the Segment dashboard. Hence, allowing more control, and modification and editing of events.

To setup middleware: 

After having completed step "Configuring Analytics" above, do the following in your AppDelegate

1- Config Middleware
```objc
config.middlewares = [
turnScreenIntoTrack,
enforceEventTaxonomy,
customizeAllTrackCalls,
sampleEventsToMixpanel,
blockScreenCallsToAmplitude,
blockEvents
]
```
where each of can be as many middleware as you wish, and are type ```SEGBlockMiddleware``` .

2- E.g if you wish to allow only certain events to be passed and , logic is as follows:


```objc
//Setup Middleware
SEGBlockMiddleware *middlewareCheckEvents = [[SEGBlockMiddleware alloc] initWithBlock:^(SEGContext * _Nonnull context, SEGMiddlewareNext  _Nonnull next) {
if (context.eventType == SEGEventTypeTrack) {
NSArray *validEvents = @[@"Home", @"SendEvents"];
SEGTrackPayload *track = (SEGTrackPayload *)context.payload;
if (![validEvents containsObject:track.event]){
NSLog(@"Dropping Rogue Event %@", track.event);
return;
}
[next context];
}
}];

// Add middleware to Analytics configuration
[configuration setMiddlewares:@[middlewareCheckEvents]];
```
More information and examples can be found here [here](https://segment.com/docs/connections/sources/catalog/libraries/mobile/ios/#examples) 

## Submitting a PR

Kindly follow the guidelines specified [here](../README.md), under "How to submit a PR".

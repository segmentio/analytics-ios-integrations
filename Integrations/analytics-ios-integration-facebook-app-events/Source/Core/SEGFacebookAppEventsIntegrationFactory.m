#import "SEGFacebookAppEventsIntegrationFactory.h"
#import "SEGFacebookAppEventsIntegration.h"

@implementation SEGFacebookAppEventsIntegrationFactory

+ (instancetype)instance {
    static dispatch_once_t once;
    static SEGFacebookAppEventsIntegrationFactory *sharedInstance;
    dispatch_once(&once, ^{
      sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    return self;
}

- (id<SEGIntegration>)createWithSettings:(NSDictionary *)settings forAnalytics:(SEGAnalytics *)analytics {
    return [[SEGFacebookAppEventsIntegration alloc] initWithSettings:settings];
}

- (NSString *)key {
    return @"Facebook App Events";
}

@end

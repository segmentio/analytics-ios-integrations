#import <Analytics/SEGIntegration.h>
#import <Foundation/Foundation.h>

@interface SEGFacebookAppEventsIntegration : NSObject<SEGIntegration>

@property (nonatomic, strong) NSDictionary *settings;

- (id)initWithSettings:(NSDictionary *)settings;

@end

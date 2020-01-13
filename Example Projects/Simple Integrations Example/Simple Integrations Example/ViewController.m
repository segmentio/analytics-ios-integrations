//
//  ViewController.m
//  Simple Integrations Example
//
//  Created by Olla Ashour on 11/21/19.
//  Copyright © 2019 Segment. All rights reserved.
//

#import "ViewController.h"
#import <Analytics/SEGAnalytics.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[SEGAnalytics sharedAnalytics] identify:@"123abc" traits:@{ @"name" : @"fred",
                                                                 @"gender" : @"male" }];
}


@end

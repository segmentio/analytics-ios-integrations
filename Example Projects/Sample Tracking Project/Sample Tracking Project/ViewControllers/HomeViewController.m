//
//  HomeViewController.m
//  Sample Tracking Project
//
//  Created by Olla Ashour on 1/14/20.
//  Copyright © 2020 Segment. All rights reserved.
//

@import Analytics;
#import "HomeViewController.h"
#import "SendEventsViewController.h"


@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *trackLifecycleSwitch;
@property (weak, nonatomic) IBOutlet UITextView *specsDocumentationTextView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Specs Documentation"
                                                                           attributes:@{ NSLinkAttributeName: [NSURL URLWithString:@"https://segment.com/docs/connections/spec/"] }];
    self.specsDocumentationTextView.attributedText = attributedString;
   
}


- (IBAction)sendEvent:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SendEventsViewController *eventsViewController = [storyboard instantiateViewControllerWithIdentifier:@"SendEventsViewController"];
    eventsViewController.eventNumber = [sender tag];
    [self.navigationController pushViewController:eventsViewController animated:true];
}

- (IBAction)trackLifeCycleEvents:(UISwitch *)sender {
    [SEGAnalytics sharedAnalytics].configuration.trackApplicationLifecycleEvents = sender.selected;
}

@end

//
//  SendEventsViewController.m
//  Sample Tracking Project
//
//  Created by Olla Ashour on 1/14/20.
//  Copyright © 2020 Segment. All rights reserved.
//

#import "SendEventsViewController.h"
@import Analytics;

@interface SendEventsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextView *textViewEditor;
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;
@property (weak, nonatomic) IBOutlet UITextView *documentationURL;
@property NSString *jsonContent;

@end

@implementation SendEventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (void)configureViews {
    
    NSString *eventURL = @""; //TODO add baseURL
    NSString *eventTitle = @"";
    NSString *fileName = @"";
    
    switch (self.eventNumber) {
        case 2:
             eventTitle = @"Track";
             eventURL = @"https://segment.com/docs/connections/spec/track/";
            break;
        case 3:
             eventTitle = @"Page";
             eventURL = @"https://segment.com/docs/connections/spec/page/";
            break;
        case 4:
             eventTitle = @"Screen";
             eventURL = @"https://segment.com/docs/connections/spec/screen/";
            break;
        case 5:
             eventTitle = @"Group";
             eventURL = @"https://segment.com/docs/connections/spec/group/";
            break;
        case 6:
            eventTitle = @"Alias";
            eventURL = @"https://segment.com/docs/connections/spec/alias/";
            break;
        default:
            eventTitle = @"Identify";
            eventURL = @"https://segment.com/docs/connections/spec/identify/";
            break;
    }
    
    fileName = eventTitle;
    
    [self configureTextView:fileName];
    self.pageTitle.text = eventTitle;
    
    //TODO: Replace specs documentation with event name
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Specs Documentation"
                                                                           attributes:@{ NSLinkAttributeName: [NSURL URLWithString:eventURL] }];
    self.documentationURL.attributedText = attributedString;
}

- (void)configureTextView: (NSString*) fileName {
   
    NSData *jsonObject = [self JSONFromFile:fileName];
    NSData *prettyJsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:nil];
    NSString *prettyPrintedJson = [[NSString alloc] initWithData:prettyJsonData encoding:NSUTF8StringEncoding];
    self.textViewEditor.text = prettyPrintedJson;

}

- (NSDictionary *)convertStringToJSON: (NSString*) jsonString {
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary  *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return jsonDic;
}

- (NSData *)JSONFromFile: (NSString*) fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (IBAction)sendEvent:(id)sender {
   
    NSString* jsonString = self.textViewEditor.text;
    NSDictionary *jsonDic = [self convertStringToJSON:jsonString];
    NSMutableDictionary *optionsDict  = [NSMutableDictionary dictionaryWithDictionary:jsonDic];
    
    switch (self.eventNumber) {
        case 2:
            [self track:jsonDic withOptions:optionsDict];
            break;
        case 3:
             [self page:jsonDic withOptions:optionsDict];
            break;
        case 4:
             [self screen:jsonDic withOptions:optionsDict];
            break;
        case 5:
             [self group:jsonDic withOptions:optionsDict];
            break;
        case 6:
            [self alias:jsonDic withOptions:optionsDict];
            break;
        default:
            [self identify:jsonDic withOptions:optionsDict];
            break;
    }
}

- (void)track:(NSDictionary *) jsonDic  withOptions:(NSMutableDictionary*) optionsDict{
   
    // Remove as userID and properties key are fixed values set by segment.
    [optionsDict removeObjectForKey:@"event"];
    [optionsDict removeObjectForKey:@"properties"];
    
    [[SEGAnalytics sharedAnalytics] track:[jsonDic objectForKey:@"event"]
                               properties:[jsonDic objectForKey:@"properties"]
                                  options:optionsDict];
}

- (void)group:(NSDictionary *) jsonDic  withOptions:(NSMutableDictionary*) optionsDict{
    
    // Remove as userID and properties key are fixed values set by segment.
    [optionsDict removeObjectForKey:@"groupId"];
    [optionsDict removeObjectForKey:@"traits"];
    
    [[SEGAnalytics sharedAnalytics] group:[jsonDic objectForKey:@"groupId"]
                                   traits:[jsonDic objectForKey:@"traits"]
                                  options:optionsDict];
}

- (void)screen:(NSDictionary *) jsonDic withOptions:(NSMutableDictionary*) optionsDict {
    // Remove as userID and properties key are fixed values set by segment.
    [optionsDict removeObjectForKey:@"name"];
    [optionsDict removeObjectForKey:@"properties"];
    
    [[SEGAnalytics sharedAnalytics] screen:[jsonDic objectForKey:@"name"]
                                 properties:[jsonDic objectForKey:@"properties"]
                                   options:optionsDict];
}

- (void)identify:(NSDictionary *) jsonDic  withOptions:(NSMutableDictionary*) optionsDict {
    [optionsDict removeObjectForKey:@"userId"];
    [optionsDict removeObjectForKey:@"traits"];
    [[SEGAnalytics sharedAnalytics] identify:[jsonDic objectForKey:@"userId"]
                                      traits:[jsonDic objectForKey:@"traits"]
                                     options:optionsDict];
}

- (void)alias:(NSDictionary *) jsonDic  withOptions:(NSMutableDictionary*) optionsDict{
    [optionsDict removeObjectForKey:@"newId"];
    [[SEGAnalytics sharedAnalytics] alias:[jsonDic objectForKey:@"newId"] options:optionsDict];
}

- (void)page:(NSDictionary *) jsonDic  withOptions:(NSMutableDictionary*) optionsDict{
    //NOT Yet Implemented by Segment
}




@end

//
//  DestinationViewController.h
//  MacysExample
//
//  Created by Daniel Stewart on 2/7/14.
//  Copyright (c) 2014 Daniel Stewart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;

@property(strong, nonatomic) NSString *resultsOutput;
- (IBAction)returnToPreviousScreen:(UIButton *)sender;

@end

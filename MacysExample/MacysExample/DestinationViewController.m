//
//  DestinationViewController.m
//  MacysExample
//
//  Created by Daniel Stewart on 2/7/14.
//  Copyright (c) 2014 Daniel Stewart. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController ()

@end

@implementation DestinationViewController

#pragma - mark View LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.resultsLabel setText:[NSString stringWithFormat:@"Tap Count: %@", self.resultsOutput]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark Service Methods
- (IBAction)returnToPreviousScreen:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

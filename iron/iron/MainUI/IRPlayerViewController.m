//
//  IRPlayerViewController.m
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/17/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "IRPlayerViewController.h"
#import <VibeProtocolFramework/VPAuthentication.h>

@implementation IRPlayerViewController

- (void) viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"user has successfully completed login flow. Unique id is %@", [VPAuthentication getLoggedInUser]);
}

@end

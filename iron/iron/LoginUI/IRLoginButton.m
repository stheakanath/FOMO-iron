//
//  IRLoginButton.m
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/15/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "IRLoginButton.h"
#import "IRGlobalConstants.h"
#import "IRLoginConstants.h"

@implementation IRLoginButton

- (id)init:(NSString*)buttonTitle buttonStyle:(NSString*)style spaceFromBottom:(CGFloat)fromBottom {
    self = [UIButton buttonWithType:UIButtonTypeCustom];
    if (self) {
        [self setFrame:CGRectMake(20, DEVICE_HEIGHT - fromBottom, IRLOGINBUTTONWIDTH, IRLOGINBUTTONHEIGHT)];
        [self setTitle:buttonTitle forState:UIControlStateNormal];
        if ([style isEqualToString:@"fb"]) {
            [self setBackgroundColor:[UIColor blueColor]];
        } else if ([style isEqualToString:@"green"]) {
            [self setBackgroundColor:[UIColor greenColor]];
        } else {
            [self setBackgroundColor:[UIColor grayColor]];
        }
    }
    return self;
}

@end

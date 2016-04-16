//
//  IRLoginButton.m
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/15/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "IRLoginButton.h"

@implementation IRLoginButton

- (id)init:(NSString*)buttonTitle buttonStyle:(NSString*)style {
    self = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setTitle:buttonTitle forState:UIControlStateNormal];
    return self;
}

@end

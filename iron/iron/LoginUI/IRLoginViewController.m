//
//  IRLoginViewController.m
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/15/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "IRLoginViewController.h"

@implementation IRLoginViewController

- (void)viewDidLoad {
    self.facebookButton = [IRLoginButton init:@"Login With Facebook" buttonStyle:@"fb"];
    [self.view addSubview:self.facebookButton];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

@end

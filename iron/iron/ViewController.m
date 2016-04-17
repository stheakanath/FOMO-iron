//
//  ViewController.m
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/13/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "ViewController.h"
#import <VibeProtocolFramework/VibeProtocolFramework.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [VPAuthentication registerUser:@"sony@vibe.io" userPassword:@"vibe"];
//    [VPAuthentication helloWorld];
    [super viewDidLoad];
}

@end

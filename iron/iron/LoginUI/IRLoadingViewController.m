//
//  IRLoadingViewController.m
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/15/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "IRLoadingViewController.h"
#import "IRLoginViewController.h"

@implementation IRLoadingViewController

- (void)interfaceSetup {
    self.logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder_logo.png"]];
    [self.view addSubview:self.logo];
    
    //Background color
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [self interfaceSetup];
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [self setUpComplete];
}

- (void)setUpComplete {
    IRLoginViewController *loginView = [[IRLoginViewController alloc] init];
    [self presentViewController:loginView animated:NO completion:nil];
//    [self p:loginView animated:NO];
}

@end

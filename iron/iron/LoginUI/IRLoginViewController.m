//
//  IRLoginViewController.m
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/15/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "IRLoginViewController.h"
#import "IRPlayerViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <VibeProtocolFramework/VPAuthentication.h>

@implementation IRLoginViewController

- (void)viewDidLoad {
    self.facebookButton = [[IRLoginButton alloc] init:@"Login With Facebook" buttonStyle:@"fb" spaceFromBottom:200];
    [self.facebookButton addTarget:self action:@selector(fbButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.signupButton = [[IRLoginButton alloc] init:@"Sign Up" buttonStyle:@"grey" spaceFromBottom:120];
    [self.signupButton addTarget:self action:@selector(signUpClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton = [[IRLoginButton alloc] init:@"Login" buttonStyle:@"green" spaceFromBottom:60];
    [self.loginButton addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 70)];
    [self.usernameField setBackgroundColor:[UIColor grayColor]];
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(0, 80, 200, 70)];
    [self.passwordField setSecureTextEntry:YES];
    [self.passwordField setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];
    
    [self.view addSubview:self.facebookButton];
    [self.view addSubview:self.signupButton];
    [self.view addSubview:self.loginButton];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (IBAction)fbButtonClicked:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
    [login logInWithReadPermissions: @[@"public_profile"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error %@", error);
         } else if (result.isCancelled) {
             NSLog(@"User cancelled login flow.");
         } else {
             [VPAuthentication registerFacebook:[result token] completed:^(NSString* response, NSError* error) {
                 if (!error) {
                     [[NSOperationQueue mainQueue] addOperationWithBlock:^() {
                         IRPlayerViewController *playerView = [[IRPlayerViewController alloc] init];
                         [self presentViewController:playerView animated:YES completion:nil];
                         
                     }];
                 }
             }];
             NSLog(@"Logged in %@", [result token]);
         }
     }];

}

- (IBAction)signUpClicked:(id)sender {
    [VPAuthentication registerUser:self.usernameField.text userPassword:self.passwordField.text completed:^(NSString* response, NSError* error) {
        if (!error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^() {
                IRPlayerViewController *playerView = [[IRPlayerViewController alloc] init];
                [self presentViewController:playerView animated:YES completion:nil];
                
            }];
        }
    }];

}

- (IBAction)loginClicked:(id)sender {
    [VPAuthentication login:self.usernameField.text userPassword:self.passwordField.text completed:^(NSString* response, NSError* error) {
        if (!error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^() {
                IRPlayerViewController *playerView = [[IRPlayerViewController alloc] init];
                [self presentViewController:playerView animated:YES completion:nil];

            }];
        }
    }];
}

@end

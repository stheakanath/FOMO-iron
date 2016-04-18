//
//  IRLoginViewController.h
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/15/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRLoginButton.h"

@interface IRLoginViewController : UIViewController

@property (nonatomic, retain) IRLoginButton *facebookButton;
@property (nonatomic, retain) IRLoginButton *signupButton;
@property (nonatomic, retain) IRLoginButton *loginButton;

@property (nonatomic, retain) UITextField *usernameField;
@property (nonatomic, retain) UITextField *passwordField;

@end

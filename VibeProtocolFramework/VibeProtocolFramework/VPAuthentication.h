//
//  Authentication.h
//  VibeProtocolFramework
//
//  Created by Kuriakose Sony Theakanath on 4/13/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VPAuthentication : NSObject

// Main methods
+ (void)registerUser:(NSString *)email userPassword:(NSString *)password;
+ (void)login:(NSString *)email userPassword:(NSString *)password;

// Testing private methods, view API for explanation
+ (void)number:(NSString *)token;
+ (void)number:(NSString *)token tokenNumber:(NSString *)number;
+ (void)helloWorld;

@end
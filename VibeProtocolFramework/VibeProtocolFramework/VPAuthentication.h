//
//  Authentication.h
//  VibeProtocolFramework
//
//  Created by Kuriakose Sony Theakanath on 4/13/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <UNIRest.h>

static NSString* uniqueUserId = nil;

@interface VPAuthentication : NSObject

typedef void (^completedHandler)(NSString* response, NSError *error);

// Main methods
+ (void)registerUser:(NSString *)email userPassword:(NSString *)password completed:(completedHandler)handle;
+ (void)login:(NSString *)email userPassword:(NSString *)password completed:(completedHandler)handle;
+ (void)registerFacebook:(FBSDKAccessToken *)token completed:(completedHandler)handle;

+ (NSString*) getLoggedInUser;

// Testing private methods, view API for explanation
+ (void)number:(NSString *)token;
+ (void)number:(NSString *)token tokenNumber:(NSString *)number;
+ (void)helloWorld;

@end
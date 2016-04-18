//
//  Authentication.m
//  VibeProtocolFramework
//
//  Created by Kuriakose Sony Theakanath on 4/13/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "VPAuthentication.h"
#import "VPConstants.h"
#import "IRError.h"

@implementation VPAuthentication

// Main methods
+ (void)registerUser:(NSString *)email userPassword:(NSString *)password completed:(completedHandler)handle {
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"email": email, @"password": password};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, LOGIN_URL];

    [[UNIRest put:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setHeaders:headers];
        [request setParameters:parameters];
        NSLog(@"%@", serverUrl);
    }] asJsonAsync:^(UNIHTTPJsonResponse* response, NSError *error) {
        NSString* userDriverId = [[NSString alloc] initWithData:response.rawBody encoding:NSUTF8StringEncoding];
        if ([userDriverId rangeOfString:@"404"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileParsingFailedError userInfo:nil];
        } else if ([userDriverId rangeOfString:@"401"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileBadLoginError userInfo:nil];
        } else if ([userDriverId rangeOfString:@"500"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileBadLoginError userInfo:nil];
        }
        uniqueUserId = userDriverId;
        handle(uniqueUserId, error);
    }];
}

+ (void)registerFacebook:(FBSDKAccessToken *)token completed:(completedHandler)handle {
    NSDictionary *parameters = @{@"token": [token userID]};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, FB_URL];
    
    [[UNIRest put:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setParameters:parameters];
        NSLog(@"%@", serverUrl);
    }] asJsonAsync:^(UNIHTTPJsonResponse* response, NSError *error) {
        NSString* userDriverId = [[NSString alloc] initWithData:response.rawBody encoding:NSUTF8StringEncoding];
        if ([userDriverId rangeOfString:@"404"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileParsingFailedError userInfo:nil];
        } else if ([userDriverId rangeOfString:@"401"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileBadLoginError userInfo:nil];
        } else if ([userDriverId rangeOfString:@"500"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileBadLoginError userInfo:nil];
        }
        uniqueUserId = userDriverId;
        handle(uniqueUserId, error);
    }];

}

+ (void)login:(NSString *)email userPassword:(NSString *)password completed:(completedHandler)handle {
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"email": email, @"password": password};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, LOGIN_URL];
    
    [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setHeaders:headers];
        [request setParameters:parameters];
        NSLog(@"%@", serverUrl);
    }] asJsonAsync:^(UNIHTTPJsonResponse* response, NSError *error) {
        NSString* userDriverId = [[NSString alloc] initWithData:response.rawBody encoding:NSUTF8StringEncoding];
        if ([userDriverId rangeOfString:@"404"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileParsingFailedError userInfo:nil];
        } else if ([userDriverId rangeOfString:@"401"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileBadLoginError userInfo:nil];
        } else if ([userDriverId rangeOfString:@"500"].location != NSNotFound) {
            error = [NSError errorWithDomain:IRIronErrorDomain code:IRProfileBadLoginError userInfo:nil];
        }
        uniqueUserId = userDriverId;
        handle(uniqueUserId, error);
    }];
}

// Testing private methods, view API for explanation
+ (void)number:(NSString *)token {
    [self number:token tokenNumber:nil];
}

+ (void)number:(NSString *)token tokenNumber:(NSString *)number {
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"token": token, @"number": number};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, TEST_URL];
    
    [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setHeaders:headers];
        [request setParameters:parameters];
        NSLog(@"%@", serverUrl);
    }] asJsonAsync:^(UNIHTTPJsonResponse* response, NSError *error) {
        NSString* newStr = [[NSString alloc] initWithData:response.rawBody encoding:NSUTF8StringEncoding];
        NSLog(@"%@", newStr);
    }];
}

+ (NSString*) getLoggedInUser {
    return uniqueUserId;
}

+ (void)helloWorld {
    NSLog(@"Hello World! VibeProtocolFramework v%@ has compiled client side! Now running some server sanity calls...", VERSION_NUMBER);
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, HELLOWORLD_URL];

    [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        NSLog(@"%@", serverUrl);
    }] asJsonAsync:^(UNIHTTPJsonResponse* response, NSError *error) {
        NSString* newStr = [[NSString alloc] initWithData:response.rawBody encoding:NSUTF8StringEncoding];
        NSLog(@"%@", newStr);
    }];
}

@end
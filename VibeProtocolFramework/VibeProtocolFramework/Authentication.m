//
//  Authentication.m
//  VibeProtocolFramework
//
//  Created by Kuriakose Sony Theakanath on 4/13/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "Authentication.h"
#import "Constants.h"
#import <UNIRest.h>

@implementation Authentication

// Main methods
+ (void)registerUser:(NSString *)email userPassword:(NSString *)password {
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"email": email, @"password": password};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, LOGIN_URL];

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

+ (void)login:(NSString *)email userPassword:(NSString *)password {
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"email": email, @"password": password};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, LOGIN_URL];
    
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
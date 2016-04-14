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

    UNIHTTPJsonResponse *response = [[UNIRest post:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }] asJson];
    
    NSLog(@"%@", response);
}

+ (void)login:(NSString *)email userPassword:(NSString *)password {
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"email": email, @"password": password};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, LOGIN_URL];
    
    UNIHTTPJsonResponse *response = [[UNIRest post:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }] asJson];
    
    NSLog(@"%@", response);
}

// Testing private methods, view API for explanation
+ (void)number:(NSString *)token {
    [self number:token tokenNumber:nil];
}

+ (void)number:(NSString *)token tokenNumber:(NSString *)number {
    NSDictionary *headers = @{@"accept": @"application/json"};
    NSDictionary *parameters = @{@"token": token, @"number": number};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, TEST_URL];
    
    UNIHTTPJsonResponse *response = [[UNIRest post:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }] asJson];
    
    NSLog(@"%@", response);
}

+ (void)helloWorld {
    NSLog(@"Hello World! VibeProtocolFramework v%@ has compiled client side! Now running some server sanity calls...", VERSION_NUMBER);
    
    NSDictionary* headers = @{@"accept": @"application/json"};
    NSString *serverUrl = [NSString stringWithFormat:@"%s%s", SERVER_URL, HELLOWORLD_URL];

    UNIHTTPJsonResponse *response = [[UNIRest post:^(UNISimpleRequest *request) {
        [request setUrl:serverUrl];
        [request setHeaders:headers];
    }] asJson];
    
    NSLog(@"%@", response);
}

@end
//
//  Authentication.m
//  VibeProtocolFramework
//
//  Created by Kuriakose Sony Theakanath on 4/13/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import "Authentication.h"
#import <UNIRest.h>

@implementation Authentication

// Main methods
+ (void)registerUser:(NSString *)email userPassword:(NSString *)password {
    
}

+ (void)login:(NSString *)email userPassword:(NSString *)password {
    
}

// Testing private methods, view API for explanation
+ (void)number:(NSString *)token {
    
}
+ (void)number:(NSString *)token tokenNumber:(NSString *)number {
    
}

+ (void)helloWorld {
    NSLog(@"Hello World! Your Framework is working well!");
    NSDictionary* headers = @{@"accept": @"application/json"};
    NSDictionary* parameters = @{@"parameter": @"value", @"foo": @"bar"};

    UNIHTTPJsonResponse *response = [[UNIRest post:^(UNISimpleRequest *request) {
        [request setUrl:@"http://httpbin.org/post"];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }] asJson];

}

@end
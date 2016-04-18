//
//  IRError.h
//  iron
//
//  Created by Kuriakose Sony Theakanath on 4/17/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const IRIronErrorDomain;

enum {
    IRUserNotLoggedInError = 1000,
    IRUserLogoutFailedError,
    IRProfileParsingFailedError,
    IRProfileBadLoginError,
    IRFNIDParsingFailedError,
};

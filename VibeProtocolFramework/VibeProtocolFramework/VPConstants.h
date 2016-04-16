//
//  Constants.h
//  VibeProtocolFramework
//
//  Created by Kuriakose Sony Theakanath on 4/14/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

// API calls
#define SERVER_URL "https://vibe-driver.herokuapp.com"

// Authentiation
#define LOGIN_URL "/api/loginreg/email"
#define FB_URL "/api/loginreg/fb"

// Sanity checks
#define TEST_URL "/api/test"
#define HELLOWORLD_URL "/"

// Framework Infomation
#define VERSION_NUMBER [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
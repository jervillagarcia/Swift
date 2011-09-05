//
//  NetworkUtil.m
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "NetworkUtil.h"


@implementation NetworkUtil

+(BOOL)checkifConnected {
    bool isValid = NO;
    NSError *error = nil;
    NSString *connected = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] encoding:NSUTF8StringEncoding error:&error];
    wait((NSInteger*)20000);
    
    if (connected == NULL) {
        isValid = NO;
    } else {
        isValid = YES;
    }
    return isValid;
}

@end

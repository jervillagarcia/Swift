//
//  WSFactory.m
//  Swift
//
//  Created by James Errol Villagarcia on 8/25/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "WSFactory.h"


@implementation WSFactory

#define SOAP_ENV @"http://www.w3.org/2003/05/soap-envelope"
#define VORTEX_URL @"https://vortex.petrafinancial.net/vortex/webservices"


-(NSData*)submitRequestToHost:(NSString*)requestString soapAction:(NSString*)sAction{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSMutableData *mData;
    
    NSURL *soapURL = [NSURL URLWithString:VORTEX_URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:soapURL];
    NSString* soapAction = [[NSString alloc] initWithString:@"http://tempuri.org/"];
    
    [request addValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[soapAction stringByAppendingString:sAction] forHTTPHeaderField:@"action"];
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:[requestString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    
    return nil;
    
}


@end

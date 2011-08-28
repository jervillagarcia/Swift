//
//  WSFactory.m
//  Swift
//
//  Created by James Errol Villagarcia on 8/25/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "WSFactory.h"


@implementation WSFactory

#define SOAP_ENV @"http://schemas.xmlsoap.org/soap/envelope/"
#define SOAP_SCHEMA @"http://www.petrafinancial.net/vortex/schemas"
#define VORTEX_URL @"https://vortex.petrafinancial.net/vortex/webservices"
#define SOAP_ACTION @"http://www.petrafinancial.net/vortex/schemas/"
#define AUTH_USERNAME @"petrauser1"
#define AUTH_PASSWORD @"P8tr@Us8r!"

-(NSData*)submitRequestToHost:(NSString*)requestString soapAction:(NSString*)sAction{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSMutableData *mData;
    
    NSURL *soapURL = [NSURL URLWithString:VORTEX_URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:soapURL];
    NSString* soapAction = [[NSString alloc] initWithString:SOAP_ACTION];
    
    [request addValue:@"text/xml; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[soapAction stringByAppendingString:sAction] forHTTPHeaderField:@"action"];
    [request setHTTPMethod:@"POST"];
    
    [request setHTTPBody:[requestString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    NSLog(@"soapURL: %@", soapURL);
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    NSError *WSerror;
    NSURLResponse *WSresponse;
    mData = [[NSMutableData alloc] initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:&WSresponse error:&WSerror]];
    
    if (WSerror && !WSresponse) {
//        [mData release];
//        mData = [NSMutableData alloc] initWithData:[self giveErrorDomainNotFound
        NSLog(@"WS Error: %@", WSerror);

    }
    [conn release];
    [soapAction release];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    return mData;
    
}

-(void)getBankDetailsWithIban:(NSString*)iban bic:(NSString*)bic currency:(NSString*)currency {
    NSMutableString *sRequest = [[NSMutableString alloc] init];
    
    [sRequest appendString:[self getStartHeader]];
    [sRequest appendString:@"<sch:DATAINPUT1>"];
    [sRequest appendString:@"<sch:IBAN>GB22CHAS60924277042101</sch:IBAN>"];
    [sRequest appendString:@"<sch:BIC>CHASGB2LXXX</sch:BIC>"];
    [sRequest appendString:@"<sch:CURRENCY>EUR</sch:CURRENCY>"];
    [sRequest appendString:@"</sch:DATAINPUT1>"];
    [sRequest appendString:[self getEndFooter]];
    
    NSData *dat = [self submitRequestToHost:sRequest soapAction:@"GetBankDetails"];
    
    NSString *sampleOutput = [[NSString alloc] initWithData:dat encoding:NSASCIIStringEncoding];
    
    NSLog(@"Request: %@", sRequest);
    NSLog(@"Output: %@", sampleOutput);
    
    
}
    
-(NSString*)getStartHeader {
    NSMutableString *sHeader = [[NSMutableString alloc] init];
    
    [sHeader appendFormat:@"<soapenv:Envelope xmlns:sch=\"%@\" xmlns:soapenv=\"%@\">", SOAP_SCHEMA, SOAP_ENV];
    [sHeader appendString:@"<soapenv:Header>"];
    [sHeader appendString:[self getHeaderAuth]];
    [sHeader appendString:@"</soapenv:Header>"];
    [sHeader appendString:@"<soapenv:Body>"];

    return sHeader;
}

-(NSString*)getHeaderAuth {
    NSMutableString *sAuth = [[NSMutableString alloc] init];
    
    [sAuth appendString:@"<wsse:Security xmlns:wsse=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd\">"];
    [sAuth appendString:@"<wsse:UsernameToken wsu:Id=\"UsernameToken-1\" xmlns:wsu=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd\">"];
    [sAuth appendString:@"<wsse:Username>"];
    [sAuth appendString:AUTH_USERNAME];
    [sAuth appendString:@"</wsse:Username>"];
    [sAuth appendString:@"<wsse:Password Type=\"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText\">"];
    [sAuth appendString:AUTH_PASSWORD];
    [sAuth appendString:@"</wsse:Password>"];
    [sAuth appendString:@"</wsse:UsernameToken>"];
    [sAuth appendString:@"</wsse:Security>"];
     
    return sAuth;
}

-(NSString*)getEndFooter {
    return @"</soapenv:Body></soapenv:Envelope>";
}

@end

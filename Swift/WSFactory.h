//
//  WSFactory.h
//  Swift
//
//  Created by James Errol Villagarcia on 8/25/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bank.h"

@interface WSFactory : NSObject {

    NSArray * wsResponse;
    
}

@property (nonatomic, retain) NSArray * wsResponse;

-(Bank*)getBankDetailsWithIban:(NSString*)iban bic:(NSString*)bic currency:(NSString*)currency;
-(void)validateIBAN:(NSString*)iban;
-(void)validateBIC:(NSString*)bic;
-(void)validateWithPaymentCode:(NSString*)paymentCode countryCode:(NSString*)countryCode;

-(NSData*)submitRequestToHost:(NSString*)requestString soapAction:(NSString*)sAction;
-(NSString*)getStartHeader;
-(NSString*)getEndFooter;
-(NSString*)getHeaderAuth;

@end

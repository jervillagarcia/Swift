//
//  Bank.h
//  Swift
//
//  Created by Errol on 8/27/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ident.h"
#import "Sepa.h"
#import "LocHeadBank.h"


@interface Bank : NSObject {
    NSString * LOCATION;
    NSString * IBAN;
    NSString * COUNTRYKV;
    NSString * NAME;
    NSString * CITY;
    NSString * ADDRESS;
    LocHeadBank * LOCHEADBANK;
    Ident * IDENT;
    Sepa * SEPA;
}
@property (nonatomic, retain) NSString * LOCATION;
@property (nonatomic, retain) NSString * IBAN;
@property (nonatomic, retain) NSString * COUNTRYKV;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * CITY;
@property (nonatomic, retain) NSString * ADDRESS;
@property (nonatomic, retain) LocHeadBank * LOCHEADBANK;
@property (nonatomic, retain) Ident * IDENT;
@property (nonatomic, retain) Sepa * SEPA;

@end

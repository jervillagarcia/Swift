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
    NSString * location;
    NSString * iban;
    NSString * countryKv;
    NSString * name;
    NSString * city;
    NSString * address;
    LocHeadBank * locHeadBank;
    Ident * ident;
    Sepa * sepa;
}
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * iban;
@property (nonatomic, retain) NSString * countryKv;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) LocHeadBank * locHeadBank;
@property (nonatomic, retain) Ident * ident;
@property (nonatomic, retain) Sepa * sepa;

@end

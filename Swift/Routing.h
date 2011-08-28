//
//  Routing.h
//  Swift
//
//  Created by Errol on 8/27/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ident.h"

@interface Routing : NSObject {
    NSString * name;
    NSString * address;
    NSString * city;
    NSString * location;
    NSString * countryKv;
    Ident * ident;
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * countryKv;
@property (nonatomic, retain) Ident * ident;

@end

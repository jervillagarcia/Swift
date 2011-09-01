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
    NSString * NAME;
    NSString * ADDRESS;
    NSString * CITY;
    NSString * LOCATION;
    NSString * COUNTRYKV;
    Ident * IDENT;
}
@property (nonatomic, retain) NSString * NAME;
@property (nonatomic, retain) NSString * ADDRESS;
@property (nonatomic, retain) NSString * CITY;
@property (nonatomic, retain) NSString * LOCATION;
@property (nonatomic, retain) NSString * COUNTRYKV;
@property (nonatomic, retain) Ident * IDENT;

@end

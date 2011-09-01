//
//  LocHeadBank.h
//  Swift
//
//  Created by Errol on 8/27/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Routing.h"

@interface LocHeadBank : NSObject {
    NSString * CITY;
    NSString * ADDRESS;
    NSString * COUNTRYKV;
    NSString * LOCATION;
    NSString * NAME;
    Ident * IDENT;
    NSMutableArray * ROUTING;

}
@property (nonatomic, retain) NSString * CITY;
@property (nonatomic, retain) NSString * ADDRESS;
@property (nonatomic, retain) NSString * COUNTRYKV;
@property (nonatomic, retain) NSString * LOCATION;
@property (nonatomic, retain) NSString * NAME;
@property (nonatomic, retain) Ident * IDENT;
@property (nonatomic, retain) NSMutableArray * ROUTING;

-(void)addRouting:(Routing*)routing;

@end

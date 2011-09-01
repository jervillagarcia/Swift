//
//  LocHeadBank.m
//  Swift
//
//  Created by Errol on 8/27/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import "LocHeadBank.h"


@implementation LocHeadBank

@synthesize CITY;
@synthesize ADDRESS;
@synthesize COUNTRYKV;
@synthesize LOCATION;
@synthesize NAME;
@synthesize IDENT;
@synthesize ROUTING;

-(id)init {
    ROUTING = [[NSMutableArray alloc] init];
    return self;
    
}

-(void)addRouting:(Routing*)routing {
    [ROUTING addObject:routing];
}

@end

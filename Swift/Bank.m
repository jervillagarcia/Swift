//
//  Bank.m
//  Swift
//
//  Created by Errol on 8/27/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import "Bank.h"


@implementation Bank
@dynamic location;
@dynamic iban;
@dynamic countryKv;
@dynamic name;
@dynamic city;
@dynamic address;
@dynamic locHeadBank;
@dynamic routings;
@dynamic bankIdent;
@dynamic sepa;


- (void)addRoutingsObject:(NSManagedObject *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"routings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"routings"] addObject:value];
    [self didChangeValueForKey:@"routings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeRoutingsObject:(NSManagedObject *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"routings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"routings"] removeObject:value];
    [self didChangeValueForKey:@"routings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addRoutings:(NSSet *)value {    
    [self willChangeValueForKey:@"routings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"routings"] unionSet:value];
    [self didChangeValueForKey:@"routings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeRoutings:(NSSet *)value {
    [self willChangeValueForKey:@"routings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"routings"] minusSet:value];
    [self didChangeValueForKey:@"routings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}




@end

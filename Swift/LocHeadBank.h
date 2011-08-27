//
//  LocHeadBank.h
//  Swift
//
//  Created by Errol on 8/27/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LocHeadBank : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * countryKv;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;

@end

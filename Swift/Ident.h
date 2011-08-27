//
//  Ident.h
//  Swift
//
//  Created by Errol on 8/27/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bank, Routing;

@interface Ident : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * bic;
@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) Bank * bank;
@property (nonatomic, retain) Routing * routing;

@end

//
//  Country.h
//  Swift
//
//  Created by James Errol Villagarcia on 9/2/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Country : NSObject {
    NSString *name;
    NSString *iso;
    NSString *countryCode;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *iso;
@property (nonatomic, retain) NSString *countryCode;

@end

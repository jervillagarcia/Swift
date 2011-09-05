//
//  Fault.h
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Fault : NSObject {
    NSString *faultcode;
    NSString *faultstring;
}

@property(nonatomic, retain) NSString *faultcode;
@property(nonatomic, retain) NSString *faultstring;

@end

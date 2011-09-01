//
//  Ident.h
//  Swift
//
//  Created by Errol on 8/28/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ident : NSObject {
    NSString * VALUE;
    NSString * BIC;
    NSString * NAME;
}
@property (nonatomic, retain) NSString * VALUE;
@property (nonatomic, retain) NSString * BIC;
@property (nonatomic, retain) NSString * NAME;

@end

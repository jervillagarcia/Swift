//
//  Ident.h
//  Swift
//
//  Created by Errol on 8/28/11.
//  Copyright (c) 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ident : NSObject {
    NSString * value;
    NSString * bic;
    NSString * name;
}
@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) NSString * bic;
@property (nonatomic, retain) NSString * name;

@end

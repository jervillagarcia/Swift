//
//  Error.h
//  Swift
//
//  Created by Errol on 9/6/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Error : NSObject {
    NSString * CODE;
    NSString * DESCRIPTION;
}

@property (nonatomic, retain) NSString * CODE;
@property (nonatomic, retain) NSString * DESCRIPTION;

@end

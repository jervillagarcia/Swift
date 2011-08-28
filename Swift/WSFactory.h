//
//  WSFactory.h
//  Swift
//
//  Created by James Errol Villagarcia on 8/25/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WSFactory : NSObject {
    
}

-(void)getBankDetailsWithIban:(NSString*)iban bic:(NSString*)bic currency:(NSString*)currency;

-(NSString*)getStartHeader;
-(NSString*)getEndFooter;
-(NSString*)getHeaderAuth;

@end

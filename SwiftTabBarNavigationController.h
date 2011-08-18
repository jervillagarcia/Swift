//
//  SwiftTabBarNavigationController.h
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BicSearchViewController.h"
#import "IbanSearchViewController.h"

@interface SwiftTabBarNavigationController : UITabBarController {
    BicSearchViewController *bicSearch;
    IbanSearchViewController *ibanSearch;
}

@property(nonatomic, retain) BicSearchViewController *bicSearch;
@property(nonatomic, retain) IbanSearchViewController *ibanSearch;

@end

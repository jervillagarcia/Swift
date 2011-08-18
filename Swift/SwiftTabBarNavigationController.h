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
#import "AboutSwiftViewController.h"
#import "AboutSepaViewController.h"

@interface SwiftTabBarNavigationController : UITabBarController {
    BicSearchViewController     *bicSearch;
    IbanSearchViewController    *ibanSearch;
    AboutSwiftViewController    *aboutSwift;
    AboutSepaViewController     *aboutSepa;

    UINavigationController *navBicSearch;
    UINavigationController *navIbanSearch;
    UINavigationController *navSwift;
    UINavigationController *navSepa;
    
    UIBarButtonItem *backItem1;
    UIBarButtonItem *backItem2;
    UIBarButtonItem *backItem3;
    UIBarButtonItem *backItem4;
}

@property(nonatomic, retain) BicSearchViewController    *bicSearch;
@property(nonatomic, retain) IbanSearchViewController   *ibanSearch;
@property(nonatomic, retain) AboutSwiftViewController   *aboutSwift;
@property(nonatomic, retain) AboutSepaViewController    *aboutSepa;

-(IBAction) backAction:(id)sender;
-(void)selectTab:(NSUInteger)tabIndex;

@end

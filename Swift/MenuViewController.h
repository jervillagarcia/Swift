//
//  MenuViewController.h
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MenuViewController : UIViewController {
    IBOutlet UIButton *btnCheckBic;
    IBOutlet UIButton *btnCheckIban;
    IBOutlet UIButton *btnAboutSwift;
    IBOutlet UIButton *btnAboutSepa;
    IBOutlet UIButton *btnInfo;
}

@property(nonatomic, retain) UIButton *btnCheckBic;
@property(nonatomic, retain) UIButton *btnCheckIban;
@property(nonatomic, retain) UIButton *btnAboutSwift;
@property(nonatomic, retain) UIButton *btnAboutSepa;
@property(nonatomic, retain) UIButton *btnInfo;

-(IBAction)clickBtnCheckBic:(id)sender;
-(IBAction)clickBtnCheckIban:(id)sender;
-(IBAction)clickBtnAboutSwift:(id)sender;
-(IBAction)clickBtnAboutSepa:(id)sender;

-(void)showTabWithIndex:(int)tabIndex;

@end

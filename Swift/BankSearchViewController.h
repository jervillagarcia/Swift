//
//  BankSearchViewController.h
//  Swift
//
//  Created by James Errol Villagarcia on 9/3/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bank.h"

@interface BankSearchViewController : UIViewController {
    UIBarButtonItem *btnMail;
    Bank * bank;
    IBOutlet UILabel * lblBankName;
    IBOutlet UILabel * lblBranch;
    IBOutlet UILabel * lblAddress;
    IBOutlet UILabel * lblPostCode;
    IBOutlet UILabel * lblCity;
    IBOutlet UILabel * lblCountry;
    IBOutlet UILabel * lblBankId;
    
}

@property (nonatomic, retain) Bank *bank;
@property (nonatomic, retain) UILabel * lblBankName;
@property (nonatomic, retain) UILabel * lblBranch;
@property (nonatomic, retain) UILabel * lblAddress;
@property (nonatomic, retain) UILabel * lblPostCode;
@property (nonatomic, retain) UILabel * lblCity;
@property (nonatomic, retain) UILabel * lblCountry;
@property (nonatomic, retain) UILabel * lblBankId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil bank:(Bank*)bank;


@end

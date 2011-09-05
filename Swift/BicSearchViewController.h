//
//  BicSearchViewController.h
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"
#import "UIActivityHUDDialog.h"
#import "UISwiftTextFieldDelegate.h"

@interface BicSearchViewController : UIViewController {
    IBOutlet UITextField    *txtBic;
    IBOutlet UITextField    *txtNationalId;
    IBOutlet UITextField    *txtCountry;
    
    Country                 *country;
    UIActivityHUDDialog     *processActivity;
    
    IBOutlet UISwiftTextFieldDelegate * textDelegate;
    IBOutlet UISwiftTextFieldDelegate * textDelegate2;
    IBOutlet UIToolbar * keyboardToolbar;
}

@property(nonatomic, retain) UIToolbar *keyboardToolbar;
@property(nonatomic, retain) UISwiftTextFieldDelegate *textDelegate;
@property(nonatomic, retain) UISwiftTextFieldDelegate *textDelegate2;
@property(nonatomic, retain) UITextField    *txtBic;
@property(nonatomic, retain) UITextField    *txtNationalId;
@property(nonatomic, retain) UITextField    *txtCountry;
@property(nonatomic, retain) Country     *country;

-(IBAction)clearAction:(id)sender;
-(IBAction)searchAction:(id)sender;
-(IBAction)countryLookupAction:(id)sender;

-(void)showCountryLookup;
-(void)setMCountry:(Country *)mCountry;

@end

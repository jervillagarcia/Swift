//
//  BicSearchViewController.h
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BicSearchViewController : UIViewController {
    IBOutlet UITextField    *txtBic;
    IBOutlet UITextField    *txtInstitutionName;
    IBOutlet UITextField    *txtNationalId;
    IBOutlet UITextField    *txtCity;
    IBOutlet UITextField    *txtCountry;
    IBOutlet UIButton       *btnCountryLookup;
    IBOutlet UIButton       *btnClear;
    IBOutlet UIButton       *btnSearch;
}

@property(nonatomic, retain) UITextField    *txtBic;
@property(nonatomic, retain) UITextField    *txtInstitutionName;
@property(nonatomic, retain) UITextField    *txtNationalId;
@property(nonatomic, retain) UITextField    *txtCity;
@property(nonatomic, retain) UITextField    *txtCountry;
@property(nonatomic, retain) UIButton    *btnCountryLookup;
@property(nonatomic, retain) UIButton    *btnClear;
@property(nonatomic, retain) UIButton    *btnSearch;

-(IBAction)clearAction:(id)sender;
-(IBAction)searchAction:(id)sender;
-(IBAction)countryLookupAction:(id)sender;

-(void)showCountryLookup;

@end

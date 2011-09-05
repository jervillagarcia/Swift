//
//  BankSearchViewController.m
//  Swift
//
//  Created by James Errol Villagarcia on 9/3/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "BankSearchViewController.h"


@implementation BankSearchViewController

@synthesize bank;
@synthesize lblBankName;
@synthesize lblBranch;
@synthesize lblAddress;
@synthesize lblPostCode;
@synthesize lblCity;
@synthesize lblCountry;
@synthesize lblBankId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil bank:(Bank*)iBank
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.bank = iBank;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    btnMail = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mail_icon.png" ] style:UIBarButtonItemStyleBordered target:self action:nil];
    
//    [self.navigationController.navigationBar.topItem setRightBarButtonItem:btnMail];
    [self.navigationItem setRightBarButtonItem:btnMail];
    // Do any additional setup after loading the view from its nib.
    
    [lblBankName        setText:bank.NAME];
    [lblBranch          setText:bank.LOCATION];
    [lblAddress         setText:bank.ADDRESS];
    [lblPostCode        setText:@""];
    [lblCity            setText:bank.CITY];
    [lblCountry         setText:bank.COUNTRYKV];
    [lblBankId          setText:bank.IDENT.BIC];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

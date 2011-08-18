//
//  BicSearchViewController.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "BicSearchViewController.h"


@implementation BicSearchViewController

@synthesize txtBic;
@synthesize txtInstitutionName;
@synthesize txtNationalId;
@synthesize txtCity;
@synthesize txtCountry;
@synthesize btnCountryLookup;
@synthesize btnClear;
@synthesize btnSearch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setTitle:@"Check BIC"];
        [self.tabBarItem setImage:[UIImage imageNamed:@"21-check_bic_logo.png"]];
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
    // Do any additional setup after loading the view from its nib.
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

#pragma mark Action(Buttons)
-(IBAction)clearAction:(id)sender{
    
}
-(IBAction)searchAction:(id)sender{
    
}
-(IBAction)countryLookupAction:(id)sender{
    
}

#pragma mark Action(Methods)
-(void)showCountryLookup{
    
}


@end

//
//  SwiftTabBarNavigationController.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "SwiftTabBarNavigationController.h"


@implementation SwiftTabBarNavigationController

@synthesize bicSearch,ibanSearch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //do nothing
    }
    return self;
}

- (void)dealloc
{
    [bicSearch release];
    [ibanSearch release];
    
    [backItem1 release];
    [backItem2 release];
    
    [navBicSearch release];
    [navIbanSearch release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    unichar backArrowCode = 0x25C0;
    
    backItem1 = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithCharacters:&backArrowCode length:1] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    backItem2 = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithCharacters:&backArrowCode length:1] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    
    self.bicSearch = [[BicSearchViewController alloc] initWithNibName:@"BicSearchViewController" bundle:nil];
    navBicSearch = [[UINavigationController alloc] initWithRootViewController:bicSearch];
    navBicSearch.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navBicSearch.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    navBicSearch.tabBarItem.image = [UIImage imageNamed:@"21-check_bic_logo.png"];
    
    self.ibanSearch = [[IbanSearchViewController alloc] initWithNibName:@"IbanSearchViewController" bundle:nil];
    navIbanSearch = [[UINavigationController alloc] initWithRootViewController:ibanSearch];
    navIbanSearch.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navIbanSearch.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    navIbanSearch.tabBarItem.image = [UIImage imageNamed:@"21-check_iban_logo.png"];
    
    self.viewControllers = [[[NSArray alloc] initWithObjects:navBicSearch, navIbanSearch, nil] autorelease];
    
    [navBicSearch.navigationBar.topItem setLeftBarButtonItem:backItem1];
    [navIbanSearch.navigationBar.topItem setLeftBarButtonItem:backItem2];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

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

#pragma mark Actions (Button
-(IBAction) backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

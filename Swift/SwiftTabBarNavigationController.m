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

    self.bicSearch = [[BicSearchViewController alloc] initWithNibName:@"BicSearchViewController" bundle:nil];
    UINavigationController *navBicSearch = [[[UINavigationController alloc] initWithRootViewController:bicSearch] autorelease];
    navBicSearch.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navBicSearch.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    navBicSearch.tabBarItem.image = [UIImage imageNamed:@"21-check_bic_logo.png"];
    
    UIButton *backButton = [UIButton buttonWithType:101];
//    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    unichar backArrowCode = 0x25C0;
    [backButton setTitle:[NSString stringWithCharacters:&backArrowCode length:1] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithCharacters:&backArrowCode length:1] style:UIBarButtonItemStylePlain target:self action:nil];

    [navBicSearch.navigationBar.topItem setLeftBarButtonItem:backItem];
    
    self.ibanSearch = [[IbanSearchViewController alloc] initWithNibName:@"IbanSearchViewController" bundle:nil];
    UINavigationController *navIbanSearch = [[[UINavigationController alloc] initWithRootViewController:ibanSearch] autorelease];
    navIbanSearch.navigationBar.barStyle = UIBarStyleBlackOpaque;
    navIbanSearch.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];    
    navIbanSearch.tabBarItem.image = [UIImage imageNamed:@"21-check_iban_logo.png"];
    
//    self.tabBarController.tabBar.hidden = NO;
//    [self.tabBarController setViewControllers:[[NSArray alloc] initWithObjects:navBicSearch, navBicSearch2, nil]];
    self.viewControllers = [[NSArray alloc] initWithObjects:navBicSearch, navIbanSearch, nil];
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

@end

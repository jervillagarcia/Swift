//
//  MenuViewController.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "MenuViewController.h"
#import "SwiftTabBarNavigationController.h"


@implementation MenuViewController

@synthesize btnCheckBic, btnCheckIban, btnAboutSwift, btnAboutSepa, btnInfo;

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

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
}

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

#pragma mark Actions (Buttons)
-(IBAction)clickBtnCheckBic:(id)sender {
    [self showTabWithIndex:0];
}

-(IBAction)clickBtnCheckIban:(id)sender {
    [self showTabWithIndex:1];
}

-(IBAction)clickBtnAboutSwift:(id)sender {
    [self showTabWithIndex:2];
}

-(IBAction)clickBtnAboutSepa:(id)sender {
    [self showTabWithIndex:3];
}

#pragma mark Actions (Methods)
-(void)showTabWithIndex:(int)tabIndex {
    
    SwiftTabBarNavigationController *navTab = [[SwiftTabBarNavigationController alloc] initWithNibName:@"SwiftTabBarNavigationController" bundle:nil];
    [self.navigationController pushViewController:navTab animated:NO];
    [navTab selectTab:tabIndex];
    [navTab release];
    
    [self.navigationController setNavigationBarHidden:YES];  
}

@end

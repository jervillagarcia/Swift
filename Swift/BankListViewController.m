//
//  BankListViewController.m
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "BankListViewController.h"
#import "SwiftBankCell.h"
#import "BankSearchViewController.h"

@implementation BankListViewController

@synthesize bankTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil banks:(NSArray*)banks
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [bankList release];
        bankList = banks;
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

#pragma TableView Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [bankList count];
}

- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"bankCell";
    
    SwiftBankCell *cell = (SwiftBankCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[SwiftBankCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier bank:(Bank*)[bankList objectAtIndex:[indexPath row]]];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BankSearchViewController *viewController = [[BankSearchViewController alloc] initWithNibName:@"BankSearchViewController" bundle:nil bank:(Bank*)[bankList objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
//    [(BicSearchViewController*)aDelegate setMCountry:(Country*)[countryList objectAtIndex:[indexPath row]]];
//    [self dismissModalViewControllerAnimated:YES];
    
}


@end

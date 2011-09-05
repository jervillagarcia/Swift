//
//  CountryLookupViewController.m
//  Swift
//
//  Created by James Errol Villagarcia on 9/3/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "CountryLookupViewController.h"
#import "SwiftAppDelegate.h"
#import "CountryParser.h"
#import "Country.h"
#import "SwiftCountryCell.h"
#import "BicSearchViewController.h"

@implementation CountryLookupViewController

@synthesize countryList;

- (id)initWithStyle:(UITableViewStyle)style delegate:(id)mDelegate
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        filePath = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"xml"];
        myData = [NSData dataWithContentsOfFile:filePath];

        NSError *parseErr;
        CountryParser *parser = [[CountryParser alloc] init];
        [parser parseXMLData:myData fromURI:@"country" toObject:@"Country" parseError:&parseErr];
        
        [countryList release];
        countryList = [[NSMutableArray alloc] initWithArray:[parser items]];
        
        aDelegate = mDelegate;
    }
    return self;
}

- (void)dealloc
{
//    [filePath release];
//    [myData release];
    [countryList release]; 
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
    return [countryList count];
}

- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    SwiftCountryCell *cell = (SwiftCountryCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[SwiftCountryCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier country:(Country*)[countryList objectAtIndex:[indexPath row]]];
        NSLog(@"Row: %i", indexPath.row);
    } else {
        [(SwiftCountryCell*)cell setMCountry:(Country*)[countryList objectAtIndex:[indexPath row]]];
    }
     
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [(BicSearchViewController*)aDelegate setMCountry:(Country*)[countryList objectAtIndex:[indexPath row]]];
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end

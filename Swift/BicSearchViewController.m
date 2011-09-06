//
//  BicSearchViewController.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "BicSearchViewController.h"
#import "BankSearchViewController.h"
#import "CountryLookupViewController.h"
#import "WSFactory.h"
#import "BankListViewController.h"
#import "Fault.h"
#import "NetworkUtil.h"

@implementation BicSearchViewController

@synthesize txtBic;
@synthesize txtNationalId;
@synthesize txtCountry;
@synthesize country;
@synthesize textDelegate;
@synthesize textDelegate2;
@synthesize keyboardToolbar;
@synthesize curTxtField;
@synthesize option2View;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setTitle:@"Check BIC"];
        [self.tabBarItem setImage:[UIImage imageNamed:@"21-check_bic_logo.png"]];
        processActivity = [[UIActivityHUDDialog alloc] initWithTitle:@"Processing..."];
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
    [txtBic setText:@""];
    [txtCountry setText:@""];
    [txtNationalId setText:@""];
    
    [self performSelector:@selector(setOption2Hidden:)];
}

-(IBAction)searchAction:(id)sender{
//    if ([NetworkUtil checkifConnected]) {
        [self performSelector:@selector(fetchBank)];
//    } else {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Problem" message:@"Could not establish internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
//        [alert release];
//    }
}

-(IBAction)countryLookupAction:(id)sender{
    CountryLookupViewController *viewController = [[CountryLookupViewController alloc] initWithNibName:@"CountryLookupViewController" bundle:nil delegate:self];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

#pragma mark Action(Methods)

-(void)setMCountry:(Country *)mCountry {
    self.country = mCountry;
    [txtCountry setText:[mCountry name]];
    [txtCountry resignFirstResponder];
}

-(void)showActivity {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [processActivity show];
    [pool release];
}

-(void)fetchBank {
    [NSThread detachNewThreadSelector:@selector(showActivity) toTarget:self withObject:nil];
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    WSFactory *ws = [[WSFactory alloc] init];
    
    if ([txtBic.text length] > 0)
        [ws validateBIC:[txtBic text]];
    else {
        if (([txtNationalId.text length] > 0) || ([txtCountry.text length] > 0)) {
            [ws validateWithPaymentCode:[txtNationalId text] countryCode:[country countryCode]];
        }
        
    }
	
    if([ws.wsResponse count] > 0) { 
        
        if (([ws.wsResponse count] == 1) && [[ws.wsResponse objectAtIndex:0] isKindOfClass:[Fault class]]) {
            [ws release];
            [pool release];
            
            [processActivity dismissWithClickedButtonIndex:0 animated:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:[(Fault*)[ws.wsResponse objectAtIndex:0] faultstring] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
            
        } else {
            BankListViewController *viewController = [[BankListViewController alloc] initWithNibName:@"BankListViewController" bundle:nil banks:ws.wsResponse];
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
            
            [ws release];
            [pool release];
            
            [processActivity dismissWithClickedButtonIndex:0 animated:YES];
        }
        
    } else {
        
        [ws release];
        [pool release];
        
        [processActivity dismissWithClickedButtonIndex:0 animated:YES];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"No results found." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }
}

-(BOOL)textFieldShouldClear:(UITextField *)textField {
	isEditing = NO;
	return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField { 
    [txtCountry resignFirstResponder];
    CountryLookupViewController *viewController = [[CountryLookupViewController alloc] initWithNibName:@"CountryLookupViewController" bundle:nil delegate:self];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

- (IBAction)setOption2Hidden:(id)sender {
    [option2View setHidden:[txtBic.text length]>0?YES:NO];
    [txtBic resignFirstResponder];
}


@end

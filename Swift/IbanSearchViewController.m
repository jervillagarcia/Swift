//
//  IbanSearchViewController.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "IbanSearchViewController.h"
#import "WSFactory.h"
#import "BankSearchViewController.h"
#import "BankListViewController.h"
#import "Fault.h"
#import "Error.h"
#import "NetworkUtil.h"

@implementation IbanSearchViewController

@synthesize txtIban;
@synthesize keyboardToolbar;
@synthesize textDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [arr release];
        arr = nil;
        
        [self.tabBarItem setTitle:@"Check IBAN"];
        [self.tabBarItem setImage:[UIImage imageNamed:@"21-check_iban_logo.png"]];
        
        processActivity = [[UIActivityHUDDialog alloc] initWithTitle:@"Processing"];
    }
    return self;
}

- (void)dealloc
{
    [arr release];
    [processActivity release];
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

#pragma mark Actions (Buttons)
#pragma mark -
- (IBAction)clickSearch:(id)sender {
    if ([NetworkUtil checkifConnected]) {
        [self performSelector:@selector(fetchBank)];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Problem" message:@"Could not establish internet connection." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

- (IBAction)clickClear:(id)sender {
    [txtIban setText:@""];
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
    
    [ws validateIBAN:txtIban.text];
	
    if([ws.wsResponse count] > 0) { 
        if (([ws.wsResponse count] == 1) && [[ws.wsResponse objectAtIndex:0] isKindOfClass:[Fault class]]) {
            [ws release];
            [pool release];
            
            [processActivity dismissWithClickedButtonIndex:0 animated:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:[(Fault*)[ws.wsResponse objectAtIndex:0] faultstring] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        } else if (([ws.wsResponse count] == 1) && [[ws.wsResponse objectAtIndex:0] isKindOfClass:[Error class]]) {
            [ws release];
            [pool release];
            
            [processActivity dismissWithClickedButtonIndex:0 animated:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[(Error*)[ws.wsResponse objectAtIndex:0] CODE] message:[(Error*)[ws.wsResponse objectAtIndex:0] DESCRIPTION] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        } else {
            [arr release];
            arr = [ws.wsResponse retain];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Validated OK." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Details", nil];
            [alert show];
            [alert release];
            
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1 : 
        {
            if ([arr count] == 1) {
                BankSearchViewController *viewController = [[BankSearchViewController alloc] initWithNibName:@"BankSearchViewController" bundle:nil bank:(Bank*)[arr objectAtIndex:0]];
                [self.navigationController pushViewController:viewController animated:YES];
                [viewController release];
            } else {
                BankListViewController *viewController = [[BankListViewController alloc] initWithNibName:@"BankListViewController" bundle:nil banks:arr];
                [self.navigationController pushViewController:viewController animated:YES];
                [viewController release];
            }
            break;
        }    
        default:
            break;
    }
    
}


@end

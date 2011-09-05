//
//  AboutSepaViewController.m
//  Swift
//
//  Created by James Errol Villagarcia on 8/18/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "AboutSepaViewController.h"


@implementation AboutSepaViewController

@synthesize webView, activityInd;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.tabBarItem setTitle:@"About SEPA"];
        [self.tabBarItem setImage:[UIImage imageNamed:@"sepa_icon.png"]];
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
    
    NSString *urlAddress = @"http://www.europeanpaymentscouncil.eu/";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    
    
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

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [activityInd setHidden:NO];
    [activityInd startAnimating];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [activityInd stopAnimating];
    
}

@end

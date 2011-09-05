//
//  ApplyFinancialViewController.m
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "ApplyFinancialViewController.h"


@implementation ApplyFinancialViewController

@synthesize webView, activityInd;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    NSString *urlAddress = @"http://www.applyfinancial.co.uk/";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    UIImage  *buttonImage = [UIImage imageNamed:@"backbutton.png"];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:buttonImage forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setFrame:CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height)];
    
    backItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    
    [self.navigationController.navigationBar.topItem     setLeftBarButtonItem:backItem1];
//    self.navigationController.navigationBar.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];
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

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

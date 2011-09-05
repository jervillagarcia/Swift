//
//  ApplyFinancialViewController.h
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ApplyFinancialViewController : UIViewController {
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *activityInd;
    UIBarButtonItem *backItem1;
}

@property(nonatomic,retain) UIWebView *webView;
@property(nonatomic, retain) UIActivityIndicatorView *activityInd;

- (IBAction)backAction:(id)sender;

@end

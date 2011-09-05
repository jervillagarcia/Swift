//
//  AboutSepaViewController.h
//  Swift
//
//  Created by James Errol Villagarcia on 8/18/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AboutSepaViewController : UIViewController {
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *activityInd;
}

@property(nonatomic,retain) UIWebView *webView;
@property(nonatomic, retain) UIActivityIndicatorView *activityInd;

@end

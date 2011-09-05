//
//  UIActivityHUDDialog.m
//  Swift
//
//  Created by James Errol Villagarcia on 9/3/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "UIActivityHUDDialog.h"


@implementation UIActivityHUDDialog

- (id)initWithTitle:(NSString*)message {
    self = [[UIAlertView alloc] initWithTitle:message 
                                      message:@"" delegate:self 
                            cancelButtonTitle:nil otherButtonTitles:nil, nil];
	if (self) 
	{
		processActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		processActivity.center = self.center;
		processActivity.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin 
						| UIViewAutoresizingFlexibleTopMargin 
						| UIViewAutoresizingFlexibleRightMargin 
						| UIViewAutoresizingFlexibleBottomMargin;	
		[self addSubview:processActivity];
		[processActivity startAnimating];
	}
	return self;
}

- (void)dealloc {
	[processActivity release];
    [super dealloc];
}


@end

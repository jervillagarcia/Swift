//
//  SwiftNavigationBar.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "SwiftNavigationBar.h"


@implementation SwiftNavigationBar

-(id) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        //disable labels for Title [Reserved for swift icon]
        [self.topItem setTitle:@""];
    }
    
    return self;
}

-(void) drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    [self setTintColor:[UIColor colorWithRed:0.5f
                                       green: 0.5f
                                        blue:0 
                                       alpha:1]];
    
    if ([self.topItem.title length] > 0 && ![self.topItem.title isEqualToString:@"Back to ..."]) {
        [[UIImage imageNamed:@"checkiban_logo.png"] drawInRect:rect];
        
        CGRect frame = CGRectMake(0, 0, 320, 44);
        UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
        [label setBackgroundColor:[UIColor clearColor]];
        label.font = [UIFont boldSystemFontOfSize: 20.0];
        label.shadowColor = [UIColor colorWithWhite:0.0 alpha:1];
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.text = self.topItem.title;
        self.topItem.titleView = label;
        
    } else {
        self.topItem.titleView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swift_topbar_icon.png"]] autorelease];
    }
}
@end

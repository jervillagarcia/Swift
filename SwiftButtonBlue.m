//
//  SwiftButtonBlue.m
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "SwiftButtonBlue.h"


@implementation SwiftButtonBlue

-(id) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];

    if (self) {
    
        [self setBackgroundImage:[UIImage imageNamed:@"button_blue.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"purple_button.png"] forState:UIControlStateHighlighted];
        [self setBackgroundImage:nil forState:UIControlStateSelected];
        
        [self setTitleColor:[UIColor whiteColor]  forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0f]];
        
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 20,0,0);
        
    }
    
    return self;
}

@end

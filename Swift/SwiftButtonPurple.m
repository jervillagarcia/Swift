//
//  SwiftButtonPurple.m
//  Swift
//
//  Created by James Errol Villagarcia on 8/18/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "SwiftButtonPurple.h"


@implementation SwiftButtonPurple

-(id) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self setBackgroundImage:[UIImage imageNamed:@"purple_button.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"button_blue.png"] forState:UIControlStateHighlighted];
        [self setBackgroundImage:nil forState:UIControlStateSelected];
        
        [self setTitleColor:[UIColor whiteColor]  forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0f]];
        
//        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        self.contentEdgeInsets = UIEdgeInsetsMake(0, 20,0,0);
        
    }
    
    return self;
}

@end

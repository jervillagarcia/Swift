//
//  SwiftCountryCell.m
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "SwiftCountryCell.h"


@implementation SwiftCountryCell

@synthesize country;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier country:(Country *)mCountry;
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.country = mCountry;

        [self.textLabel         setText:[country name]];
        [self.detailTextLabel   setText:[country countryCode]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

- (void)setMCountry:(Country*)mCountry {
    [country release];
    country = nil;
    self.country = mCountry;
    
    [self.textLabel         setText:[country name]];
    [self.detailTextLabel   setText:[country countryCode]];
}

@end

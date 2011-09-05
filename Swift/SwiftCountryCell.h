//
//  SwiftCountryCell.h
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"


@interface SwiftCountryCell : UITableViewCell {
    Country *country;
}

@property (nonatomic, retain) Country *country;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier country:(Country *)mCountry;
- (void)setMCountry:(Country*)mCountry;

@end

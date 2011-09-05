//
//  SwiftBankCell.h
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bank.h"


@interface SwiftBankCell : UITableViewCell {
    Bank *bank;
}

@property (nonatomic, retain) Bank *bank;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier bank:(Bank *)mBank;
- (void)setBank:(Bank *)mBank;

@end

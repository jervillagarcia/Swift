//
//  CountryLookupViewController.h
//  Swift
//
//  Created by James Errol Villagarcia on 9/3/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountryLookupViewController : UITableViewController<UITableViewDelegate, UIActionSheetDelegate> {
    NSArray *countryList;
    NSString *filePath;
    NSData *myData;
    id aDelegate;
}

@property (nonatomic, retain) NSArray *countryList;

- (id)initWithStyle:(UITableViewStyle)style delegate:(id)mDelegate;

@end

//
//  BankListViewController.h
//  Swift
//
//  Created by Errol on 9/5/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BankListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *bankTable;
    NSArray *bankList;
}

@property (nonatomic, retain) UITableView *bankTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil banks:(NSArray*)banks;

@end

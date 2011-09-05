//
//  CountryLookupViewController.h
//  Swift
//
//  Created by James Errol Villagarcia on 9/3/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountryLookupViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, UISearchBarDelegate> {
    IBOutlet UISearchBar *searchBar;
    IBOutlet UITableView *countryTable;

    NSArray *countryList;
    NSMutableArray *filteredList;
    NSMutableArray *tempList;
    
    BOOL isSearching;
    
    NSString *filePath;
    NSData *myData;
    id aDelegate;
}

@property (nonatomic, retain) UISearchBar *searchBar;
@property (nonatomic, retain) UITableView *countryTable;
@property (nonatomic, retain) NSArray *countryList;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(id)mDelegate;

@end

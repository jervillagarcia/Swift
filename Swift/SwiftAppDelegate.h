//
//  SwiftAppDelegate.h
//  Swift
//
//  Created by Errol on 8/16/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwiftAppDelegate : NSObject <UIApplicationDelegate> {
    NSArray *countryList;
    NSString *filePath;
    NSData *myData;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) NSArray *countryList;

@end

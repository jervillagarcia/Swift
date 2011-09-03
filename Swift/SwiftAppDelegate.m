//
//  SwiftAppDelegate.m
//  Swift
//
//  Created by Errol on 8/16/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "SwiftAppDelegate.h"
#import "CountryParser.h"
#import "Country.h"

@implementation SwiftAppDelegate


@synthesize window=_window;

@synthesize navigationController=_navigationController;

@synthesize countryList;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    
    filePath = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"xml"];
    myData = [NSData dataWithContentsOfFile:filePath];
    
    NSError *parseErr;
    CountryParser *parser = [[CountryParser alloc] init];
    [parser parseXMLData:myData fromURI:@"country" toObject:@"Country" parseError:&parseErr];
    
    [countryList release];
    countryList = [[[NSMutableArray alloc] initWithArray:[parser items]] autorelease];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [filePath release];
    [myData release];
    [countryList release];
    [super dealloc];
}

@end

//
//  IbanSearchViewController.h
//  Swift
//
//  Created by Errol on 8/17/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISwiftTextFieldDelegate.h"

@interface IbanSearchViewController : UIViewController<UITextFieldDelegate> {
    IBOutlet UITextField * txtIban;
    IBOutlet UIToolbar * keyboardToolbar;
    
    IBOutlet UISwiftTextFieldDelegate * textDelegate;
}

@property (nonatomic, retain) UITextField               * txtIban;
@property (nonatomic, retain) UIToolbar                 * keyboardToolbar;
@property (nonatomic, retain) UISwiftTextFieldDelegate  * textDelegate;

- (IBAction)clickSearch:(id)sender;
- (IBAction)clickClear:(id)sender;

@end

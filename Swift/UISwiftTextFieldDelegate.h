//
//  UISwiftTextFieldDelegate.h
//  Swift
//
//  Created by James Errol Villagarcia on 8/18/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UISwiftTextFieldDelegate : UIView<UITextFieldDelegate> {
    UIView			*view;
	UIToolbar		*keyToolbar;
	NSMutableArray	*txtArr;
	NSMutableArray  *txtArrReverse;
	UITextField		*curTxtField;

}

@property(nonatomic, retain) IBOutlet UIView *view;
@property(nonatomic, retain) IBOutlet UIToolbar *keyToolbar;

-(IBAction)nextField:(id)sender;
-(IBAction)prevField:(id)sender;
-(IBAction)hideKeyboard:(id)sender;
-(void)awakeFromNib;
-(void)dealloc;

@end

//
//  UISwiftTextFieldDelegate.m
//  Swift
//
//  Created by James Errol Villagarcia on 8/18/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "UISwiftTextFieldDelegate.h"


@implementation UISwiftTextFieldDelegate

@synthesize view, keyToolbar;

- (void)awakeFromNib{
	NSArray *subviews = view.subviews;
	txtArr = [[NSMutableArray alloc] init];
	for (id subview in subviews) {
		if ([subview isKindOfClass:[UITextField class]]) {
			[txtArr addObject:subview];
		}
	}
	
	txtArrReverse = [[NSMutableArray alloc] initWithArray:[[[[NSArray alloc] initWithArray: txtArr] reverseObjectEnumerator] allObjects]];
}

-(BOOL)textField:(UITextField *)txtField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if ([txtField keyboardType] == UIKeyboardTypePhonePad) {
		if ([txtField.text length] >= 11) {
			if ([string length] == 0) return YES;
			return NO;
		}
	}else 	if ([txtField keyboardType] == UIKeyboardTypeNumberPad) {
		if ([txtField.text length] >= [txtField minimumFontSize]) {
			if ([string length] == 0) return YES;
			return NO;
		}
	}
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[self performSelector:@selector(nextField:) withObject:theTextField];
	return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
	[textField setInputAccessoryView:keyToolbar];
	curTxtField = textField;
}	

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
{
    //- (void)textFieldDidEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
    //	[self performSelector:@selector(hideKeyboard:) withObject:textField];	
	return YES;
}

-(IBAction)nextField:(id)sender{
	for (id subview in txtArr) {
		UITextField *txtField = (UITextField*)curTxtField;
		if (txtField == subview){
			if ([txtField tag] < [txtArr count]){
				if ([txtField tag] == [txtArr count] - 1) {
					[txtField resignFirstResponder];
				}
				[(UITextField*)[view viewWithTag:[txtField tag] + 1] becomeFirstResponder];
				break;
			} else {
				[txtField resignFirstResponder];
			}
		}
	}
}

-(IBAction)prevField:(id)sender {
	for (id subview in txtArr) {
		UITextField *txtField = (UITextField*)curTxtField;
		if (txtField == subview){
			if ([txtField tag] > 0){
				[(UITextField*)[view viewWithTag:[txtField tag] - 1] becomeFirstResponder];
			} else {
				[txtField resignFirstResponder];
			}
		}
	}
}

-(IBAction)hideKeyboard:(id)sender{
	for (id subview in txtArr) {
		UITextField *txtField = (UITextField*)subview;
		[txtField resignFirstResponder];
	}
	
}

-(void)dealloc {
	[txtArr release];
	[super dealloc];
}

@end

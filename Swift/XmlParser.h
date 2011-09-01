//
//  XmlParser.h
//  Swift
//
//  Created by James Errol Villagarcia on 8/25/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ident.h"
#import "Routing.h"
#import "LocHeadBank.h"
#import "Sepa.h"
#import "Bank.h"

@interface XmlParser : NSObject<NSXMLParserDelegate> {
	NSString *className;
	NSString *uri;
	NSMutableArray *items;
	NSObject *item;
	NSString *currentNodeName;
	NSMutableString *currentNodeContent;
    
    Ident *currentIdent;
    Routing *currentRouting;
    LocHeadBank *currentLocHeadBank;
    Sepa *currentSepa;
    Bank *currentBank;
}

@property (retain) Ident *currentIdent;
@property (retain) Routing *currentRouting;
@property (retain) LocHeadBank *currentLocHeadBank;
@property (retain) Sepa *currentSepa;
@property (retain) Bank *currentBank;

@property (retain) NSString *className;
@property (retain) NSString *uri;
@property (retain) NSMutableArray *items;
@property (retain) NSObject *item;
@property (retain) NSString *currentNodeName;
@property (retain) NSMutableString *currentNodeContent;

- (NSArray *)items;
//- (id)parseXMLData:(NSData *)data toObject:(NSString *)aClassName parseError:(NSError **)error;
- (id)parseXMLData:(NSData *)data fromURI:(NSString*)fromURI toObject:(NSString *)aClassName parseError:(NSError **)error;

@end

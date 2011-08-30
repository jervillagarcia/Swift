//
//  XmlParser.h
//  CaxtonFX
//
//  Created by Reg on 11/20/09.
//  Copyright 2009 Petra Financial Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlParser : NSObject {
	NSString *className;
	NSString *uri;
	NSMutableArray *items;
	NSObject *item;
	NSString *currentNodeName;
	NSMutableString *currentNodeContent;
}

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

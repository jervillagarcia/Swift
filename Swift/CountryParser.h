//
//  CountryParser.h
//  Swift
//
//  Created by James Errol Villagarcia on 9/2/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CountryParser : NSObject<NSXMLParserDelegate> {
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

//- (NSArray *)items;
- (id)parseXMLData:(NSData *)data fromURI:(NSString*)fromURI toObject:(NSString *)aClassName parseError:(NSError **)error;

@end

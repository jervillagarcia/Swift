//
//  CountryParser.m
//  Swift
//
//  Created by James Errol Villagarcia on 9/2/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "CountryParser.h"


@implementation CountryParser

@synthesize className;
@synthesize uri;
@synthesize items;
@synthesize item;
@synthesize currentNodeName;
@synthesize currentNodeContent;

//- (NSArray *)items
//{
//	return items;
//}

- (id)parseXMLData:(NSData *)data fromURI:(NSString*)fromURI toObject:(NSString *)aClassName parseError:(NSError **)error
{
	
	[items release];
	items = [[NSMutableArray alloc] init];
	
	[className release];
	className = [aClassName copy];//[[NSString alloc] initWithString:aClassName];
	
	//[uri release];
	uri = [fromURI copy];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
	[parser setDelegate:self];
	[parser setShouldProcessNamespaces:YES];
	[parser setShouldReportNamespacePrefixes:YES];
	[parser setShouldResolveExternalEntities:YES];
	
	[parser parse];
	[parser release];
	/*
	 if([parser parserError] &&error) {
	 *error = [parser parserError];
	 }
	 */
	return [self retain];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    	if([[elementName uppercaseString] isEqualToString:[uri uppercaseString]] || [elementName isEqualToString:@"Fault"]) {
    		item = [[NSClassFromString([[elementName uppercaseString] isEqualToString:[uri uppercaseString]]?className:@"Fault") alloc] init];
            
            [item setValue:[attributeDict objectForKey:@"iso"] forKey:@"iso"];
            [item setValue:[attributeDict objectForKey:@"code"] forKey:@"countryCode"];

            currentNodeName = [elementName copy];
            currentNodeContent = [[NSMutableString alloc] init];
    	}
    	else {
    		if (![elementName isEqualToString:@"NULL"]){
    			currentNodeName = [elementName copy];
    			currentNodeContent = [[NSMutableString alloc] init];
    		}
    	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    	if([elementName isEqualToString:uri] || [elementName isEqualToString:@"Fault"]) {

            [item setValue:currentNodeContent forKey:@"name"];

            [currentNodeContent release];
            currentNodeContent = nil;
            
            [currentNodeName release];
            currentNodeName = nil;
    		
    		[items addObject:item];
    		[item release];
    		item = nil;
    	}
    	else if([elementName isEqualToString:currentNodeName] && [elementName isEqualToString:@"Header"] == NO) {
    		if (![elementName isEqualToString:@"NULL"]){
                if ([elementName isEqualToString:@"country"]) {
                    [item setValue:currentNodeContent forKey:@"name"];

                }
                [currentNodeContent release];
                currentNodeContent = nil;
                
                [currentNodeName release];
                currentNodeName = nil;
    		}
    	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{   
	[currentNodeContent appendString:string];
}

- (void)dealloc
{
	[className release];
	[item release];
	[currentNodeName release];
	[currentNodeContent release];
	[items release];
	[super dealloc];
}

@end

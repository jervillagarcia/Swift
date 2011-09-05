//
//  XmlParser.m
//  Swift
//
//  Created by James Errol Villagarcia on 8/25/11.
//  Copyright 2011 ApplyFinancial. All rights reserved.
//

#import "XmlParser.h"


@implementation XmlParser

@synthesize className;
@synthesize uri;
@synthesize items;
@synthesize item;
@synthesize currentNodeName;
@synthesize currentNodeContent;

@synthesize currentIdent;
@synthesize currentRouting;
@synthesize currentLocHeadBank;
@synthesize currentSepa;
@synthesize currentBank;



- (NSArray *)items
{
	return items;
}

/*
- (id)parseXMLData:(NSData *)data toObject:(NSString *)aClassName parseError:(NSError **)error
{
	[items release];
	items = [[NSMutableArray alloc] init];
	
	[className release];
	className = [aClassName copy];//[[NSString alloc] initWithString:aClassName];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
	[parser setDelegate:self];
	[parser setShouldProcessNamespaces:YES];
	[parser setShouldReportNamespacePrefixes:YES];
	[parser setShouldResolveExternalEntities:YES];
	
	[parser parse];
	[parser release];

	return self;
}
*/

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
//	if([[elementName uppercaseString] isEqualToString:[uri uppercaseString]] || [elementName isEqualToString:@"Fault"]) {
//		item = [[NSClassFromString([[elementName uppercaseString] isEqualToString:[uri uppercaseString]]?className:@"Fault") alloc] init];
//	}
//	else {
//        if ([subItems 
//        subitem = [[NSClassFromString([[elementName uppercaseString] isEqualToString:[uri uppercaseString]]?className:@"Fault") alloc] init];
//		if (![elementName isEqualToString:@"NULL"]){
//			currentNodeName = [elementName copy];
//			currentNodeContent = [[NSMutableString alloc] init];
//		}
//	}
    if ([elementName  isEqualToString:@"IDENT"]) {
        currentIdent = [[Ident alloc] init];
    }else if ([elementName  isEqualToString:@"ROUTING"]) {
        currentRouting = [[Routing alloc] init];
    }else if ([elementName  isEqualToString:@"LOCHEADBANK"]) {
        currentLocHeadBank = [[LocHeadBank alloc] init];
    }else if ([elementName  isEqualToString:@"SEPA"]) {
        currentSepa = [[Sepa alloc] init];
    }else if ([elementName  isEqualToString:@"BANK"]) {
        currentBank = [[Bank alloc] init];
    }else if ([elementName  isEqualToString:@"Fault"]) {
        item = [[NSClassFromString(@"Fault") alloc] init];
    }else{
        currentNodeName = [elementName copy];
        currentNodeContent = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
//	if([elementName isEqualToString:uri] || [elementName isEqualToString:@"Fault"]) {
//		
//		[items addObject:item];
//		[item release];
//		item = nil;
//	}
//	else if([elementName isEqualToString:currentNodeName] && [elementName isEqualToString:@"Header"] == NO) {
//		if (![elementName isEqualToString:@"NULL"]){
//            [item setValue:currentNodeContent forKey:elementName];
//			
//			[currentNodeContent release];
//			currentNodeContent = nil;
//			
//			[currentNodeName release];
//			currentNodeName = nil;
//		}
//	}
    
    if ([elementName  isEqualToString:@"BANK"]) {
        [items addObject:currentBank];
        
        [currentBank release];
        currentBank = nil;
    }else if ([elementName  isEqualToString:@"SEPA"]) {
        [currentBank setSEPA:currentSepa];
        
        [currentSepa release];
        currentSepa = nil;
    }else if ([elementName  isEqualToString:@"LOCHEADBANK"]) {
        [currentBank setLOCHEADBANK:currentLocHeadBank];
        
        [currentLocHeadBank release];
        currentLocHeadBank = nil;
    }else if ([elementName  isEqualToString:@"ROUTING"]) {
//        [currentLocHeadBank add
        [currentLocHeadBank addRouting:currentRouting];
        
        [currentRouting release];
        currentRouting = nil;
    }else if ([elementName  isEqualToString:@"IDENT"]) {
        if (currentRouting){
            [currentRouting setIDENT:currentIdent];
        }else if (currentLocHeadBank) {
            [currentLocHeadBank setIDENT:currentIdent];
        }else{
            [currentBank setIDENT:currentIdent];
        }
        [currentIdent release];
        currentIdent = nil;
    }else if ([elementName  isEqualToString:@"Fault"]) {
        [items addObject:item];
        [item release];
        item = nil;
    }else{
        if (currentIdent) {
            [currentIdent setValue:currentNodeContent forKey:elementName];
        
            [currentNodeContent release];
            currentNodeContent = nil;
            
        } else if (currentRouting) {
            [currentRouting setValue:currentNodeContent forKey:elementName];
            
            [currentNodeContent release];
            currentNodeContent = nil;
            
        } else if (currentSepa) {
            [currentSepa setValue:currentNodeContent forKey:elementName];
            
            [currentNodeContent release];
            currentNodeContent = nil;
        } else if (currentLocHeadBank) {
            [currentLocHeadBank setValue:currentNodeContent forKey:elementName];
            
            [currentNodeContent release];
            currentNodeContent = nil;
            
        } else if (currentBank) {
            [currentBank setValue:currentNodeContent forKey:elementName];
            
            [currentNodeContent release];
            currentNodeContent = nil;
        } else {
            [item setValue:currentNodeContent forKey:elementName];

            [currentNodeContent release];
            currentNodeContent = nil;
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

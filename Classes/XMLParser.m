//
//  XMLParser.m
//  XMLParserTutorial
//
//  Created by Kent Franks on 5/6/11.
//  Copyright 2011 TheAppCodeBlog. All rights reserved.
//

#import "XMLParser.h"
#import "Tweet.h"

@implementation XMLParser
@synthesize tweets;
@synthesize dicRes;


-(id) loadXMLByURL:(NSString *)urlString
{
	tweets			= [[NSMutableArray alloc] init];
    dicRes          = [[NSMutableDictionary alloc]init];

	NSURL *url		= [NSURL URLWithString:urlString];
	NSData	*data   = [[NSData alloc] initWithContentsOfURL:url];
	parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
	return self;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    tweets=[[NSMutableArray alloc]init];
    dicRes=[[NSMutableDictionary alloc]init];
    NSLog(@"Test");
    
}
// sent when the parser begins parsing of the document.

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementname isEqualToString:@"xml"]) 
	{
		//currentTweet = [Tweet alloc];
        
        dicaccommodation=[[NSMutableDictionary alloc]init];
        dicattraction=[[NSMutableDictionary alloc]init];
        dicinfo_centre=[[NSMutableDictionary alloc]init];
        dicmountain=[[NSMutableDictionary alloc]init];
        
        dic=[[NSMutableDictionary alloc]init];
        
        
	}
    else if ([elementname isEqualToString:@"mountain_info"] || [elementname isEqualToString:@"accommodation_info"] || [elementname isEqualToString:@"attraction_info"] || [elementname isEqualToString:@"info_centre_info"] )
	{
        array=[[NSMutableArray alloc]init];

        //[array removeAllObjects];
	}
    else if([elementname isEqualToString:@"mountain"]||[elementname isEqualToString:@"accommodation"] || [elementname isEqualToString:@"attraction"] || [elementname isEqualToString:@"info_centre"] || [elementname isEqualToString:@"xml"])
    {
        dic=[[NSMutableDictionary alloc]init];

        //[dic removeAllObjects];
    }
    else if([elementname isEqualToString:@"listing_info"])
    {
        arrayList=[[NSMutableArray alloc] init];
        dicTemp=dic;

        
    }
    else if([elementname isEqualToString:@"listing"])
    {
       // dicList=[[NSMutableDictionary alloc]init];
        dic=[[NSMutableDictionary alloc]init];

    }
    
    
}
- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementname isEqualToString:@"xml"])
    {
    }
	else if ([elementname isEqualToString:@"mountain_info"] || [elementname isEqualToString:@"accommodation_info"] || [elementname isEqualToString:@"attraction_info"] || [elementname isEqualToString:@"info_centre_info"] )
	{
		//currentTweet.content = currentNodeContent;
        //[tweets addObject:array];
        [dicRes setObject:array forKey:elementname];
        
        //dic=nil;
	}
    else if([elementname isEqualToString:@"mountain"]||[elementname isEqualToString:@"accommodation"] || [elementname isEqualToString:@"attraction"] || [elementname isEqualToString:@"info_centre"])
    {
        
        [array addObject:dic];
    }
    else if([elementname isEqualToString:@"listing_info"])
    {
        dic=[[NSMutableDictionary alloc]init];
        dic=dicTemp;
        
        [dic setObject:arrayList forKey:elementname];
    }
    else if([elementname isEqualToString:@"listing"])
    {
        [arrayList addObject:dic];
    }
    else
    {
        [dic setObject:currentNodeContent forKey:elementname];
        
    }
//	if ([elementname isEqualToString:@"created_at"])
//	{
//		currentTweet.dateCreated = currentNodeContent;
//	}
//	if ([elementname isEqualToString:@"status"]) 
//	{
//		[tweets addObject:currentTweet];
//		[currentTweet release];
//		currentTweet = nil;
//		[currentNodeContent release];
//		currentNodeContent = nil;
//	}
}

- (void)parserDidEndDocument:(NSXMLParser *)parser;
{
    
}
- (void) dealloc
{
	[parser release];
	[super dealloc];
}

@end

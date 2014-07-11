//
//  XMLParser.h
//  XMLParserTutorial
//
//  Created by Kent Franks on 5/6/11.
//  Copyright 2011 TheAppCodeBlog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"


@interface XMLParser : NSObject <NSXMLParserDelegate>
{

	NSMutableString	*currentNodeContent;
	NSMutableArray	*tweets;

	NSXMLParser		*parser;
	Tweet			*currentTweet;
    NSMutableDictionary *dicmountain,*dicaccommodation,*dicattraction,*dicinfo_centre;
    NSMutableDictionary *dic;
    NSMutableArray *array;
    NSMutableDictionary *dicRes;
    NSMutableArray *arrayList;
    NSMutableDictionary *dicList;
    NSMutableDictionary *dicTemp;
	
}

@property (readonly, retain) NSMutableArray	*tweets;
@property (readonly, retain) NSMutableDictionary *dicRes;


-(id) loadXMLByURL:(NSString *)urlString;


@end

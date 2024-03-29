//
//  RootViewController.h
//  XMLParserTutorial
//
//  Created by Kent Franks on 5/6/11.
//  Copyright 2011 TheAppCodeBlog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface RootViewController : UITableViewController 
{
	XMLParser *xmlParser;
	
	UIImageView *customImage;
    
    NSMutableArray *arrayCopy;
    NSMutableDictionary *Response;
}


@property (nonatomic, retain) UIImageView *customImage;

@end
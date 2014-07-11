//
//  RootViewController.m
//  XMLParserTutorial
//
//  Created by Kent Franks on 5/6/11.
//  Copyright 2011 TheAppCodeBlog. All rights reserved.
//

#import "RootViewController.h"
#import "Tweet.h"


@implementation RootViewController

@synthesize customImage;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	//xmlParser = [[XMLParser alloc] loadXMLByURL:@"http://api.twitter.com/1/statuses/user_timeline/KentFranks.xml"];
    
   // xmlParser = [[XMLParser alloc]loadXMLByURL:@"http://www.edumobile.org/blog/uploads/XML-parsing-data/Data.xml"];
    
    
    xmlParser = [[XMLParser alloc]loadXMLByURL:@"http://192.241.215.85/whatmountain/index.php/xml"];
    
   // http://192.241.215.85/whatmountain/index.php/xml
    
    NSLog(@"ArrayCopy=%@",[xmlParser tweets]);

	
	//arrayCopy=[[xmlParser tweets] copy];
    
    Response=[[xmlParser dicRes] copy];
    
    NSLog(@"ArrayCopy=%@",Response);
    
	
	self.title = @"Tweets";
	
}





#pragma mark -
#pragma mark Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [arrayCopy count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	UIImage	 *twitterLogo = [[UIImage imageNamed:@"twitter-logo.png"]autorelease];
	
	//Tweet *currentTweet = [[xmlParser tweets] objectAtIndex:indexPath.row];
	
	CGRect imageFrame = CGRectMake(2, 8, 40, 40);
	self.customImage = [[[UIImageView alloc] initWithFrame:imageFrame] autorelease];
	self.customImage.image = twitterLogo;
	[cell.contentView addSubview:self.customImage];
	
	CGRect contentFrame = CGRectMake(45, 2, 265, 30);
	UILabel *contentLabel = [[[UILabel alloc] initWithFrame:contentFrame] autorelease];
	contentLabel.numberOfLines = 2;
	contentLabel.font = [UIFont boldSystemFontOfSize:12];
	contentLabel.text = [[arrayCopy objectAtIndex:indexPath.row] valueForKey:@"address"];
	[cell.contentView addSubview:contentLabel];
	
	CGRect dateFrame = CGRectMake(45, 40, 265, 10);
	UILabel *dateLabel = [[[UILabel alloc] initWithFrame:dateFrame] autorelease];
	dateLabel.font = [UIFont systemFontOfSize:10];
	dateLabel.text = [[arrayCopy objectAtIndex:indexPath.row] valueForKey:@"country"];
	[cell.contentView addSubview:dateLabel];
	
	
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 55;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning 
{
	
    [super didReceiveMemoryWarning];
	
}

- (void)viewDidUnload 
{
	
}


- (void)dealloc 
{
	[xmlParser release];
    [super dealloc];
}


@end


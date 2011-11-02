//
//  SearchController.m
//  SearchExample
//
//  Created by C.P. Lim on 18/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SearchController.h"

static NSString * const APP_PROPERTY_FILE = @"Config.plist";

@implementation SearchController

@synthesize whatField;
@synthesize whereField;
@synthesize queryBuilderFactory;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) dealloc
{
    [whatField release];
    [whereField release];
    [queryBuilderFactory release];
    [super dealloc];
}

-(IBAction)search:(id)sender
{
//    SESensisSearchURL* searchUrl = [SESensisSearchURL sensisSearchURLWithApiKey:apiKey];
//    [[searchUrl searchFor:[whatField text]] at:[whereField text]];
//    [searchService searchBy:searchUrl delegate:nil];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // apiKey
    if(queryBuilderFactory == nil)
    {
        NSString* path = [[NSBundle mainBundle] bundlePath];
        NSString* realPath = [path stringByAppendingPathComponent:APP_PROPERTY_FILE];
        NSDictionary* dictionary = [NSDictionary dictionaryWithContentsOfFile:realPath];
        queryBuilderFactory = [[SEQueryBuilderFactory alloc] initWithSensisApiKey:[dictionary valueForKey:@"Sensis Search API Key"]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

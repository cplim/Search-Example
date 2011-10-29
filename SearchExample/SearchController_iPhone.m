//
//  SearchController_iPhone.m
//  SearchExample
//
//  Created by C.P. Lim on 18/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SearchController_iPhone.h"
#import "SEIPhoneSearchResultsController.h"

@implementation SearchController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)search:(id)sender
{
    [super search:sender];
    
    // search results
    SESearchService* service = [[SESearchService alloc] init];
    SESearchResults* searchResults = [[SESearchResults alloc] initWithSearchService:service apiKey:[self apiKey]];
    searchResults.searchTerm = [whatField text];
    searchResults.locationTerm = [whereField text];
    [searchResults fetchRestulsForPage:1];
    SEIPhoneSearchResultsController* resultsController = [[SEIPhoneSearchResultsController alloc] initWithSearchResults:searchResults];
    [self.navigationController pushViewController:resultsController animated:YES];
    [resultsController release];
    [searchResults release];
    [service release];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

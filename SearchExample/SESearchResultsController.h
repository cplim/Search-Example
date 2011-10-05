//
//  SESearchResultsController.h
//  SearchExample
//
//  Created by C.P. Lim on 5/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SESearchService.h"

@interface SESearchResultsController : UITableViewController {
    NSString* searchTerm;
    NSString* locationTerm;
    NSString* apiKey;
    SESearchService* searchService;
}

- (void)search;

@property (nonatomic, retain) NSString* searchTerm;
@property (nonatomic, retain) NSString* locationTerm;
@property (nonatomic, retain) NSString* apiKey;
@property (nonatomic, retain) SESearchService* searchService;

@end

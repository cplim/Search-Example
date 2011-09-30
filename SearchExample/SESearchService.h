//
//  SESearchService.h
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEQueryURL.h"

@interface SESearchService : NSObject 
- (void) searchBy:(id<SEQueryURL>)search delegate:(id)delegate;
@end

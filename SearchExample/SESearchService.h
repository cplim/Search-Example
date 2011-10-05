//
//  SESearchService.h
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEQueryURL.h"

@interface SESearchService : NSObject {
    BOOL completed;
    int completedStatus;
    NSMutableData* data;
}
- (void)searchBy:(id<SEQueryURL>)search delegate:(id)delegate;
- (void)searchBy:(id<SEQueryURL>)search;

@property (nonatomic) BOOL completed;
@property (nonatomic) int completedStatus;
@property (readonly) NSData* data;

@end

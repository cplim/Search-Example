//
//  SearchService.h
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchService : NSObject {
    NSString* apiKey;
}
- (id) initWithApiKey: (NSString*)apiKey;
- (void) searchFor:(NSString*)what at:(NSString*)where delegate:(id)delegate;
@end
